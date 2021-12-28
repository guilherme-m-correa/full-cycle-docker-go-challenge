FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN go install

FROM scratch

COPY --from=builder /go/bin/app /app

ENTRYPOINT ["/app"]