# 使用 Node.js 镜像作为基础镜像
FROM node:12.18.0 as builder

# 设置工作目录
WORKDIR /app

# 拷贝 package.json 和 package-lock.json 到工作目录
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 拷贝项目源代码到工作目录
COPY . .

# 构建 VuePress 项目
RUN npm run build

#RUN ls 

#RUN pwd

#RUN cd /app/docs/.vuepress/dist

RUN pwd
RUN ls
VOLUME /root/mount
RUN cp -r /app /root/mount

RUN ls /root/mount
# 指定容器启动时执行的命令（本例中为空命令，因为我们不需要在容器内运行该项目）
CMD []
# 创建一个新的镜像用于最终部署
# FROM nginx:latest

# 将构建好的 VuePress 项目文件复制到 Nginx 的 HTML 目录下
# COPY --from=builder /app/docs/.vuepress/dist /usr/share/nginx/html

# 设置 Nginx 的配置文件
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露容器的 80 端口
