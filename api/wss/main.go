package main

import (
	"flag"
	"log"
	"net/http"
)

func main() {
	var addr = flag.String("a", "9090", "The addr of the application.")
	flag.Parse() // parse the flags

	c := newChannel()

	http.Handle("/", c)

	// get the channel/room going
	go c.run()
	// fmt.Println("Data:", modules.GetAppModules("54789c07-bb43-4db4-8b2d-1a8e1f8c67f1"))

	// start the web server
	log.Println("Starting web server on", *addr)
	if err := http.ListenAndServe(*addr, nil); err != nil {
		log.Fatal("ListenAndServe", err)
	}
}
