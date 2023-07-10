FROM node:alpine

RUN npm config set registry https://registry.npm.taobao.org
RUN npm run install
RUN npm run docs:dev
