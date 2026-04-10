FROM golang:1.26.2 AS builder
COPY go.mod go.sum .
RUN go mod download
COPY main.go .
COPY components components
RUN mkdir /out && CGO_ENABLED=0 go build -o /out/app main.go

FROM alpine AS runner
COPY --from=builder --chmod=+x /out/app /server
EXPOSE 8080
ENTRYPOINT ["/server"]


