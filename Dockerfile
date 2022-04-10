FROM golang:1.18.0-bullseye as build

WORKDIR /go/src/app
ADD . /go/src/app

RUN go get -d -v ./...

RUN go build -o /go/bin/helloworld

FROM gcr.io/distroless/base-debian11
COPY --from=build /go/bin/helloworld /
CMD ["/helloworld"]