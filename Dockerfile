FROM node:12.18.0  AS builder

RUN npm config set registry https://registry.npm.taobao.org
WORKDIR /app
RUN pwd
COPY . .
RUN npm install
RUN npm run docs:build
RUN npm run build