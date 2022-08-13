FROM golang:1.19.0-alpine AS builder
WORKDIR /go/src/mypackage/myapp/
COPY hello.go .
RUN go build hello.go

FROM scratch
COPY --from=builder /go/src/mypackage/myapp/hello /go/bin/hello
ENTRYPOINT ["/go/bin/hello"]