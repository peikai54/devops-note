FROM node:alpine

RUN npm config set registry https://registry.npm.taobao.org
COPY . /docs
WORKDIR /docs
RUN pwd
RUN ls
RUN npm run install
RUN npm run docs:dev
