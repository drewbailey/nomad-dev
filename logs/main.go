package main

import (
	"fmt"
	"math/rand"
	"net/http"
	"time"
)

func main() {
	for {
		dur1 := rand.Intn(2000)
		dur2 := rand.Intn(2000)
		tick := time.NewTicker(time.Duration(dur1) * time.Millisecond)
		tick2 := time.NewTicker(time.Duration(dur2) * time.Millisecond)
		select {
		case <-tick.C:
			_, err := http.Get("http://192.168.1.54:8081")
			if err != nil {
				fmt.Println(err.Error())
			}
		case <-tick2.C:
			_, err := http.Get("http://192.168.1.54:8080")
			if err != nil {
				fmt.Println(err.Error())
			}
		}
	}
}
