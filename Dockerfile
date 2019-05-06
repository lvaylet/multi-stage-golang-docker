FROM golang:1.12.4-alpine AS builder
# Create application folder in $GOPATH so `go get ./...` 
# works as expected below
WORKDIR $GOPATH/src/app
# Install git to let `go get` fetch dependencies
RUN apk add --no-cache git
# Copy source to working directory
COPY main.go ./
# Fetch all dependencies and cross compile application
# 
# Note the use of `CGO_ENABLED` to let the Go compiler link the 
# libraries on the system. It is enabled by default for native 
# build in order to reduce the binary size. This time we use 
# `scratch` as our base image. It is a special Docker image with 
# nothing in it (not even libraries). We need to disable the CGO 
# parameter to let the compiler package all the libraries required 
# by the application into the binary.
RUN go get ./... \
 && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/main

# ---

FROM scratch AS production
COPY --from=builder /go/bin/main /go/bin/main
EXPOSE 8080
ENTRYPOINT ["/go/bin/main"]
