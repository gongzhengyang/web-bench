.PHONY: init
init:
	cargo install oha
	cargo build -r
	cd go-src && go build -o ../target/gin-server

.PHOGY: gin
gin:
	oha -z 30s -c 10000 --latency-correction --disable-keepalive http://127.0.0.1:8080/ping

.PHONY: axum
axum:
	oha -z 30s -c 10000 --latency-correction --disable-keepalive http://127.0.0.1:9999/ping

.PHONY: gin-server
gin-server:
	GIN_MODE=release ./target/gin-server

.PHONY: axum-server
axum-server:
	./target/release/axum-server

