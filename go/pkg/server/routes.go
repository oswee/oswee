package server

import (
	"net/http"

	"github.com/gorilla/mux"
	"github.com/lpar/gzipped"
)

//NewRouter is main routing entry point
func newRouter() *mux.Router {
	router := mux.NewRouter().StrictSlash(true)

	// TODO: This is a dumb workaround. Need to make "any-path except static/dist" to resolve index.html
	// or just simply serve dist directory where index.html should be picked up automatically by browsers.
	router.HandleFunc("/", indexGetHandler)
	router.HandleFunc("/favicon.ico", faviconGetHandler).Methods(http.MethodGet)

	fs := gzipped.FileServer(http.Dir("./web/app/dist/"))

	router.PathPrefix("/dist/").Handler(http.StripPrefix("/dist/", fs))

	return router
}
