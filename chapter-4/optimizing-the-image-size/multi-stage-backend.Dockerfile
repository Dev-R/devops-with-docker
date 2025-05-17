# example-backend        light       6b06a31f2efa   About a minute ago   18.6MB

FROM golang:1.20-alpine AS build-stage

WORKDIR /usr/src/app

COPY go.mod go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o backend

FROM scratch

COPY --from=build-stage /usr/src/app/backend /

EXPOSE 8080

CMD ["./backend"]