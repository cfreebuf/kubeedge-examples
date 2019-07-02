# make cruiser
.PHONY: default cruiser
cruiser:
	go build cruiser.go
	sudo docker build -t cruiser:v1.0 .
	sudo docker tag cruiser:v1.0 registry.cn-beijing.aliyuncs.com/freebuf/cruiser:v1.0
	sudo docker push registry.cn-beijing.aliyuncs.com/freebuf/cruiser:v1.0
	kubectl apply -f deployment.yaml

.PHONY: cross_build
cross_build:
	export GOARCH=arm \
        export GOOS="linux" \
        export GOARM=6 \
        export CGO_ENABLED=0 \
        export CC=arm-linux-gnueabihf-gcc; \
	go build cruiser.go
	sudo docker build -t cruiser:v0.1 .
	sudo docker tag cruiser:v0.1 registry.cn-beijing.aliyuncs.com/freebuf/cruiser:v0.1
	sudo docker push registry.cn-beijing.aliyuncs.com/freebuf/cruiser:v0.1
	kubectl apply -f deployment.yaml

