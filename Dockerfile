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

COPY --from=builder /app/docs/.vuepress/dist /app/dist

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

# 启动 Nginx 服务器
CMD ["nginx", "-g", "daemon off;"]