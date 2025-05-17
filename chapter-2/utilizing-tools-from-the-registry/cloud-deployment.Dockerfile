# Dockerfile

FROM node:20-alpine

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

# Process Description

- 1- Read Render documentation on Docker
- 2- Created a new Web Service
- 3- Pasted the project GitHub Repository URL
- 4- Updated the Web Service Dockerfile path to matches the Repository's ./Dockerfile.production
- 5- Set the Web Service PORT to matches image's one of 5173
- 6- Clicked deploy

# Deployed Service Link

- https://instagram-clone-9c8n.onrender.com/explore

* My free instance will spin down with inactivity, which can delay requests by 50 seconds or more.