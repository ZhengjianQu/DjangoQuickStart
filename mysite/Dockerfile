# 使用官方的Python基础镜像
FROM python:3.10-slim

# 设置工作目录
WORKDIR /app

# 安装必要的系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    pkg-config \
    libmariadb-dev \
    netcat-openbsd \
    && apt-get clean

# 复制项目的依赖文件
COPY requirements.txt .

# 安装项目的依赖
RUN pip install -r requirements.txt

# 复制项目的所有文件到工作目录
COPY . .

# 公开Django默认端口
EXPOSE 8000

# 等待MySQL服务,运行Django开发服务器
CMD ["sh", "-c", "./wait-for-it.sh mysql 3306","python manage.py runserver 0.0.0.0:8000"]
