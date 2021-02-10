FROM golang:latest
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -a -o scylla-bench

FROM scratch
COPY --from=0 /go/src/app/scylla-bench /
ENTRYPOINT ["/scylla-bench"]