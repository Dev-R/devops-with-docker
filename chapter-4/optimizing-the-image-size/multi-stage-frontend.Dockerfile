FROM node:16-alpine AS build-stage

EXPOSE 5000

WORKDIR /usr/src/app

COPY package* .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:stable-alpine

COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]