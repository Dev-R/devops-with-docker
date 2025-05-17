# Before Size Optimization and Security Changes

FROM node:20
WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

RUN yarn global add serve

COPY . .

RUN yarn build

ENV PORT=5173
ENV HOST=0.0.0.0

EXPOSE 5173 

CMD ["serve", "-s", "dist", "-l", "5173"]


# After Size  Optimization and Security Changes
FROM node:20-alpine AS build-stage

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

# Use non-root unprivileged Nginx image version
FROM nginxinc/nginx-unprivileged:stable-alpine

COPY --from=build-stage /app/dist /usr/share/nginx/html

ENV PORT=5173
ENV HOST=0.0.0.0

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]