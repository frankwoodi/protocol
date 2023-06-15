
GOPATH=$HOME/go
PROTO_PATH=proto
GO_OUT=go_protocol
generate_go: 
	protoc \
	-I ${GOPATH}/pkg/mod \
	-I ${GOPATH}/pkg/mod/github.com/livekit/protocol \
	-I ${GOPATH}/pkg/mod/github.com/envoyproxy/protoc-gen-validate \
	--proto_path=${PROTO_PATH} \
	${PROTO_PATH}/*.proto \
	--go_out=paths=source_relative:./${GO_PROTOCOL} \
	--validate_out="lang=go,paths=source_relative:./${GO_PROTOCOL}"

generate: generate_go