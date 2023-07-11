FROM node:12.18.0  AS builder

RUN npm config set registry https://registry.npm.taobao.org
WORKDIR /app
COPY . .
RUN pwd
RUN ls
RUN npm install
RUN npm run docs:build
RUN cd docs 
RUN ls

FROM nginx:latest

COPY --from=builder /app /app
WORKDIR /app
RUN pwd 
RUN ls