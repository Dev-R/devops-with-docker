# Frontend
Previous image size: 1.29GB
Optimized image size: 495MB


## Optimized Image Dockerfile
FROM node:16-alpine # We use alpine instead

EXPOSE 5000

WORKDIR /usr/src/app

COPY package* .

RUN npm install

COPY . .

RUN npm run build && npm install -g serve

CMD ["serve", "-s", "-l", "5000", "build"]




# Backend
Previous image size: 1.28GB
Optimized image size: 685MB


## Optimized Image Dockerfile
FROM golang:1.20-alpine

EXPOSE 8080

WORKDIR /usr/src/app

COPY go.mod go.sum .

RUN go mod download

COPY . .

RUN go build -v && addgroup --system appgroup \
    && adduser --system --ingroup appgroup app \
    && chown -R app:appgroup /usr/src/app

USER app



CMD ["./server"]