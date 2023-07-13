# 使用基础的 Node.js 镜像作为构建环境
FROM node:12.18.0 as build

# 设置工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到工作目录
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 将项目源代码复制到工作目录
COPY . .

# 执行构建命令（例如，使用 webpack 或其他构建工具）
RUN npm run build


# 创建一个临时容器来将构建内容复制到主机上的挂载目录中
FROM alpine

# 挂载宿主机上的目录到容器中
VOLUME /root/mount

# 从第一个阶段的构建容器中复制构建内容到主机的挂载目录
COPY --from=build /app /root/mount
RUN ls /root/mount
