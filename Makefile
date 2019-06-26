# make cruiser
.PHONY: default cruiser
cruiser:
	go build cruiser.go
	docker build -t cruiser:v1.0 .
