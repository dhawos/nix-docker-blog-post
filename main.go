package main

import (
	"log"
	"net/http"

	"example-app/components"
)

func main() {
	http.HandleFunc("/bar", func(w http.ResponseWriter, r *http.Request) {
		component := components.Hello(r.URL.Path)
		err := component.Render(r.Context(), w)
		if err != nil {
			w.WriteHeader(500)
			return
		}
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
