# mysql/Dockerfile

# 使用官方的MySQL基础镜像
FROM mysql:8.0

# 设置环境变量
ENV MYSQL_ROOT_PASSWORD=db123456
ENV MYSQL_DATABASE=docker-mysql-quickstart
ENV MYSQL_USER=qzj
ENV MYSQL_PASSWORD=db123456

# 持久化数据卷
VOLUME /var/lib/mysql

# 暴露MySQL的默认端口
EXPOSE 3306
