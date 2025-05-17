# Frontend

## Frontend Dockerfile
FROM node:16

EXPOSE 5000

ENV REACT_APP_BACKEND_URL="http://127.0.0.1:8080/"

WORKDIR /usr/src/app

COPY package* .

RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve

CMD ["serve", "-s", "-l", "5000", "build"]

## Frontend Commands
docker run -d -p 127.0.0.1:5000:5000 --name hello-frontend example-frontend

# Backend

## Backend Dockerfile
FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/src/app

ENV REQUEST_ORIGIN="http://127.0.0.1:5000"

COPY go.mod go.sum .
RUN go mod download

COPY . .
RUN go build -v


CMD ["./server"]

## Backend Commands
docker run -d -p 127.0.0.1:8080:8080 --name hello-backend example-backend