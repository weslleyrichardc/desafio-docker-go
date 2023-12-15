FROM golang:latest AS BUILD

COPY main.go /go/src/main.go

RUN go build -o /go/bin/main /go/src/main.go

FROM scratch

COPY --from=BUILD /go/bin/main /

ENTRYPOINT [ "./main" ]
