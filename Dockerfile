FROM node:14-alpine3.15

RUN npm install -g http-server

WORKDIR /usr/src/app

RUN apk add g++ make python2

COPY package*.json ./
RUN npm ci

COPY . .

RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]
