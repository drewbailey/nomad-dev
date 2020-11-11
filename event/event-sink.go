package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/hashicorp/nomad/api"
)

func main() {
	http.HandleFunc("/", WebHook)
	http.ListenAndServe(":8080", nil)
	fmt.Println("vim-go")
}

func WebHook(w http.ResponseWriter, r *http.Request) {
	// Return a 201
	var event api.Events
	dec := json.NewDecoder(r.Body)
	err := dec.Decode(&event)
	if err != nil {
		panic(err)
	}

	w.WriteHeader(http.StatusCreated)
	fmt.Println("received event!")
	fmt.Println(event.Index)
}
