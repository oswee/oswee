package main

import (
	"encoding/json"
	"fmt"
	"log"

	"github.com/gorilla/websocket"
	v1 "github.com/oswee/prime/proto/oswee/modules/v1"
)

// random comment to test husky
// https://play.google.com/books/reader?id=Er0pIQAAAEAJ&pg=GBS.PA641

// client represents a single chatting user
type client struct {
	// socket is the web socket for this client.
	socket *websocket.Conn
	//send is a channel on which messages are sent.
	send chan *Envelope
	// channel is the channel this client is currently joined
	channel *channel
}

// https://eagain.net/articles/go-dynamic-json/

// Service represents an RPC service to be called
type Service int

//go:generate jsonenums -type=Service

const (
	// ApplicationsService ...
	ApplicationsService Service = iota
	// ModulesService ...
	ModulesService
)

// RPC represents the action type received from the websocket
type RPC int

//go:generate jsonenums -type=RPC

const (
	// ListApplicationsRequest ...
	ListApplicationsRequest RPC = iota
	// ListApplicationsResponse ...
	ListApplicationsResponse
	// ListModulesRequest ...
	ListModulesRequest
	// ListModulesResponse ...
	ListModulesResponse
)

// Envelope represents an container to be exchanged between client and server
type Envelope struct {
	Service Service `json:"service"`
	// Rpc represents an action type
	RPC RPC `json:"rpc"` // ISSUE: https://github.com/campoy/jsonenums/issues/28#issue-299906485
	// Message holds actual Event data
	Message interface{} `json:"message,omitempty"`
}

// MESSAGE SIGNATURES

// // UILauncherDisplayPayload ...
// type UILauncherDisplayPayload struct {
//  Stakeholder string `json:"stakeholder,omitempty"`
// }

// // UILauncherHidePayload ...
// type UILauncherHidePayload struct {
//  Stakeholder string `json:"stakeholder,omitempty"`
// }

// // ThemeSwitch ...
// type ThemeSwitch struct {
//  Theme string `json:"theme,omitempty"`
// }

// // ApplicationGetPayload ...
// type ApplicationGetPayload struct{}

// // ApplicationGetSuccessPayload ...
// type ApplicationGetSuccessPayload *Applications

// // ModuleGetPayload ...
// type ModuleGetPayload struct{}

// // ModuleGetSuccessPayload ...
// type ModuleGetSuccessPayload *Modules

// // AppNavigationListFetchModulesPayload ...
// type AppNavigationListFetchModulesPayload struct{}

// // AppNavigationListModulesRequestPayload ...
// type AppNavigationListModulesRequestPayload struct {
//  ID string `json:"id,omitempty"`
// }

// ListApplicationsRequestPayload ...
type ListApplicationsRequestPayload struct{}

// ListModulesRequestPayload ...
type ListModulesRequestPayload struct {
	ID string `json:"id,omitempty"`
}

// // ApplicationListApplicationsRequestPayload ...
// type ApplicationListApplicationsRequestPayload struct{}

// ErrorPayload ...
type ErrorPayload struct {
	Error   string `json:"error,omitempty"`
	Message string `json:"message,omitempty"`
}

var rpcHandlers = map[RPC]func() interface{}{
	// UI_LAUNCHER_DISPLAY: func() interface{} { return &UILauncherDisplayPayload{} },
	// UI_LAUNCHER_HIDE:    func() interface{} { return &UILauncherHidePayload{} },
	// THEME_SWITCH:        func() interface{} { return &ThemeSwitch{} },
	// APPLICATION__GET:    func() interface{} { return &ApplicationGetPayload{} },
	// // APPLICATION_GET_SUCCESS: func() interface{} { return &apps },
	// MODULE_GET: func() interface{} { return &ModuleGetPayload{} },
	// // ERROR: func() interface{} { return &ErrorPayload{} },
	// APP_NAVIGATION__LIST_FETCH_MODULES_REQUEST: func() interface{} { return &AppNavigationListFetchModulesPayload{} },
	// APP_NAVIGATION__LIST_MODULES_REQUEST:       func() interface{} { return &AppNavigationListModulesRequestPayload{} },
	// APPLICATION__LIST_APPLICATIONS_REQUEST:     func() interface{} { return &ApplicationListApplicationsRequestPayload{} },
	ListApplicationsRequest: func() interface{} { return &ListApplicationsRequestPayload{} },
	ListModulesRequest:      func() interface{} { return &v1.ListModulesResponse{} },
}

func (c *client) read() {
	defer c.socket.Close()

	for {
		// Read the plain message from the socket
		_, message err := c.socket.ReadMessage()
		if err != nil {
			return
		}

		fmt.Println("Local Addr:", c.socket.LocalAddr(), "Remote Addr:", c.socket.RemoteAddr(), "Pure event:", string(message))

		var rawMessage json.RawMessage
		envelope := Envelope{
			Message: &rawMessage,
		}
		if err := json.Unmarshal([]byte(message), &envelope); err != nil {
			log.Fatal("Unable to unmarshal the message into envelope:", err, message)
		}
		// str := fmt.Sprintf("%v", evt.Payload)
		// fmt.Println("Evt:", reflect.TypeOf(str))

		m := rpcHandlers[envelope.RPC]()
		if err := json.Unmarshal(rawMessage, m); err != nil {
			// TODO: Reply with error message if receive unhandled message type
			e := Envelope{
				// RPC: WEBSOCKET__ERROR,
				Message: &ErrorPayload{
					Message: "Unsupported message signature",
					// TODO: Should not send server side errors to the client (debug only)
					Error: err.Error(), // Error as string
				},
			}
			c.channel.forward <- &e
			// log.Fatal("Payload:",err,raw)
		}
		switch m.(type) {
		// case *UILauncherDisplayPayload:
		//  c.channel.forward <- &evt
		// case *UILauncherHidePayload:
		//  c.channel.forward <- &evt
		// case *ThemeSwitch:
		//  c.channel.forward <- &evt
		// case *ApplicationGetPayload:
		//  c.channel.forward <- &Event{
		//    Type:    APPLICATION__GET_SUCCESS,
		//    Payload: &Apps,
		//  }
		// case *ApplicationGetSuccessPayload:
		//  c.channel.forward <- &evt
		// case *ModuleGetPayload:
		//  c.channel.forward <- &Event{
		//    Type:    MODULE_GET_SUCCESS,
		//    Payload: &modules,
		//  }
		// case *AppNavigationListFetchModulesPayload:
		//  c.channel.forward <- &Event{
		//    Type:    APP_NAVIGATION__LIST_FETCH_MODULES_SUCCESS,
		//    Payload: &modules,
		//  }
		// case *AppNavigationListModulesRequestPayload:
		//  // https://blog.golang.org/json
		//  // TODO: Use protobuf stubs for message declarations
		//  type Msg struct {
		//    Type    Kind `json:"type"`
		//    Payload struct {
		//      ID string `json:"id,omitempty"`
		//    } `json:"payload,omitempty"`
		//  }
		//  var ms Msg
		//  if err := json.Unmarshal([]byte(msg), &ms); err != nil {
		//    log.Fatal("Event:", err, msg)
		//  }
		//  // fmt.Println("Type:", ms.Payload.ID)
		//  c.channel.forward <- &Event{
		//    Type:    APP_NAVIGATION__LIST_MODULES_RESPONSE,
		//    Payload: modules.GetAppModules(ms.Payload.ID),
		//  }
		case *ListApplicationsRequestPayload:
			c.channel.forward <- &Envelope{
				Service: ApplicationsService,
				RPC:     ListApplicationsResponse,
				Message: applications.getApplications(),
			}
		case *ListModulesRequestPayload:
			type ListModulesResponsePayload struct {
				RPC     RPC `json:"rpc"`
				Message struct {
					Parent string `json:"parent,omitempty"`
				} `json:"message,omitempty"`
			}
			var response ListModulesResponsePayload
			// Unmarshal the original message
			if err := json.Unmarshal([]byte(message), &response); err != nil {
				log.Fatal("Event:", err, message)
			}
			// TODO: Returning &Envelope is not right??? Should be new object???
			c.channel.forward <- &Envelope{
				Service: ModulesService,
				RPC:     ListModulesResponse,
				Message: modules.GetAppModules(response.Message.Parent),
			}
		}
	}
}

func (c *client) write() {
	defer c.socket.Close()
	for event := range c.send {
		evt, err := json.Marshal(event)
		if err != nil {
			fmt.Println(err)
			return
		}
		err1 := c.socket.WriteMessage(websocket.TextMessage, evt)
		if err1 != nil {
			return
		}
	}
},
