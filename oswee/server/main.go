package main

import (
	"crypto/tls"
	"flag"
	"log"
	"net/http"
	"time"
)

func main() {
	port := flag.String("p", ":9443", "port to serve on")
	directory := flag.String("d", "/home/dzintars/test-data", "the directory of static file to host")
	flag.Parse()

	http.Handle("/", http.FileServer(http.Dir(*directory)))

	tlsConfig := &tls.Config{
		PreferServerCipherSuites: true,
		CurvePreferences: []tls.CurveID{
			tls.CurveP256,
			tls.X25519,
		},
		MaxVersion: tls.VersionTLS13,
		CipherSuites: []uint16{
			tls.TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,
			tls.TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,
			tls.TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305,
			tls.TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305,
			tls.TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,
			tls.TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,
		},
	}

	srv := &http.Server{
		Addr:         *port,
		ReadTimeout:  5 * time.Second,
		WriteTimeout: 10 * time.Second,
		IdleTimeout:  120 * time.Second,
		TLSConfig:    tlsConfig,
		Handler:      nil,
	}

	log.Printf("Serving %s on HTTP port: %s\n", *directory, srv.Addr)

	err := srv.ListenAndServeTLS(
		"/home/dzintars/.tls/oswee.com/fullchain.pem",
		"/home/dzintars/.tls/oswee.com/privkey.pem",
	)

	if err != nil {
		log.Fatalf("server failed to start: %v", err)
	}
}
