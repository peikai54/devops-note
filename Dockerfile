FROM node:12.18.0

RUN npm config set registry https://registry.npm.taobao.org
COPY . /docs
WORKDIR /docs
RUN pwd
RUN ls
RUN npm install
RUN npm run docs:dev
