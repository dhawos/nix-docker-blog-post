FROM golang@sha256:fcdb3e42c5544e9682a635771eac76a698b66de79b1b50ec5b9ce5c5f14ad775 AS builder
COPY go.mod go.sum .
RUN go mod download
COPY main.go .
COPY components components
RUN mkdir /out && CGO_ENABLED=0 go build -o /out/app main.go

FROM alpine@sha256:a76a5883dc20c193bd6eb522e940c5d3979ab4af8011d5972a928fb7156fcb9e AS runner
COPY --from=builder --chmod=+x /out/app /server
EXPOSE 8080
ENTRYPOINT ["/server"]


