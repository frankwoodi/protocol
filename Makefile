GOPATH="${HOME}/go"
PROTO_PATH=proto
GO_OUT=go_protocol
PB_REL="https://github.com/protocolbuffers/protobuf/releases"

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

install:
	sudo apt install -y protobuf-compiler 
	protoc --version

manual_install:
	curl -LO ${PB_REL}/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip
	unzip protoc-3.15.8-linux-x86_64.zip -d ${HOME}/.local
	export PATH="${PATH}:${HOME}/.local/bin"
	rm ./protoc-3.15.8-linux-x86_64.zip
	protoc --version
version:
	protoc --version