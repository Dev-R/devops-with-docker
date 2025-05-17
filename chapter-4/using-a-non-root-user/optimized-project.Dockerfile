# Frontend
FROM node:16

EXPOSE 5000

WORKDIR /usr/src/app

COPY package* .

RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve


# The node images provide node user with uid 1000 to act as Non-root User. 
# Based on https://github.com/goldbergyoni/nodebestpractices/blob/master/sections/security/non-root-user.md
USER node

CMD ["serve", "-s", "-l", "5000", "build"]

# Backend
FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/src/app

COPY go.mod go.sum .

RUN go mod download

COPY . .

RUN go build -v


RUN addgroup --system appgroup \
    && adduser --system --ingroup appgroup app

RUN chown -R app:appgroup /usr/src/app

USER app



CMD ["./server"]