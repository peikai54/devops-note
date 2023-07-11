FROM node:12.18.0  AS builder

RUN npm config set registry https://registry.npm.taobao.org
WORKDIR /app
COPY . .
RUN pwd
RUN ls
RUN npm install
RUN npm run docs:build

FROM nginx:latest

COPY --from=builder /app /app
RUN pwd 
RUN ls