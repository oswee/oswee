package main

import (
	"log"
	"net/http"

	"github.com/gorilla/websocket"
)

type channel struct {
	// forward is a channel that holds incoming messages
	// that should be forwarded to the other clients.
	forward chan *Envelope
	// join is a channel for clients wishing to join the channel.
	join chan *client
	// leave is a channel for clients wishing to leave the channel.
	leave chan *client
	// clients holds all current clients in this channel.
	clients map[*client]bool
}

func (c *channel) run() {
	for {
		select {
		case client := <-c.join:
			// join - add client to the channel
			c.clients[client] = true
			// fmt.Println("Clients:", c.clients)
		case client := <-c.leave:
			// leaving - remove client from the channel
			delete(c.clients, client)
			// close the channel
			close(client.send)
			// fmt.Println("Clients:", c.clients)
		case event := <-c.forward:
			// send the event to the all clients in this channel
			for client := range c.clients {
				client.send <- event
			}
		}
	}
}

const (
	socketBufferSize  = 1024
	messageBufferSize = 256
)

var upgrader = &websocket.Upgrader{
	CheckOrigin:     func(r *http.Request) bool { return true },
	ReadBufferSize:  socketBufferSize,
	WriteBufferSize: socketBufferSize,
}

func (c *channel) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	socket, err := upgrader.Upgrade(w, req, nil)
	if err != nil {
		log.Fatal("ServeHTTP:", err)
		return
	}
	client := &client{
		socket:  socket,
		send:    make(chan *Envelope, messageBufferSize),
		channel: c,
	}
	c.join <- client
	defer func() { c.leave <- client }()
	// Get real IP address behind proxy
	// fmt.Println(req.Header.Get("X-Forwarded-For"))
	go client.write()
	client.read()
}

// newChannel makes a new channel
func newChannel() *channel {
	return &channel{
		forward: make(chan *Envelope),
		join:    make(chan *client),
		leave:   make(chan *client),
		clients: make(map[*client]bool),
	}
}
