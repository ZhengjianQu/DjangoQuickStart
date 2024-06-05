
# Django技术文件

## 1. 环境配置相关指令

```bash
# 更新包列表并安装所需包
sudo apt-get update && sudo apt-get install -y gcc pkg-config libmariadb-dev netcat-openbsd

# 安装 MySQL 服务器
sudo apt install mysql-server

# 启动 MySQL 服务
sudo systemctl start mysql

# 设置 MySQL 服务开机启动
sudo systemctl enable mysql

# 创建 Python 虚拟环境
python -m venv <env_name>

# 激活虚拟环境
source <env_name>/bin/activate

# 安装项目所需的 Python 包
pip install -r requirements.txt
```

## 2. Docker 和 Docker Compose 指令

```bash
# 查看运行中的容器
docker ps

# 启动已存在的容器
docker start <mysql_container_id>

# 运行新的 MySQL 容器
docker run --name docker-mysql-quickstart -e MYSQL_ROOT_PASSWORD=db123456 -e MYSQL_DATABASE=quickstart -e MYSQL_USER=qzj -e MYSQL_PASSWORD=db123456 -p 3306:3306 -d mysql:latest

# 进入 MySQL 容器的终端
docker exec -it docker-mysql-quickstart bash

# 检查 MySQL 容器日志
docker logs docker-mysql-quickstart

# 创建 Docker 网络
docker network create mynetwork

# 将容器连接到网络
docker network connect mynetwork docker-mysql-quickstart
docker network connect mynetwork <django_container_id>

# 获取 MySQL 容器的 IP 地址
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker-mysql-quickstart

# 重启容器
docker restart <django_container_id>
docker restart <mysql_container_id>

# 使用 Docker Compose 构建和启动服务
docker-compose up --build

# 停止并移除容器
docker-compose down

# 进入正在运行的容器的终端
docker-compose exec -it <container_name> bash

# 列出所有 Docker 容器
docker ps

# 构建 Docker 镜像
docker build -t <image_name> .

# 保存 Docker 镜像到文件
docker save -o <file_name> <image_name>

# 从文件加载 Docker 镜像
docker load -i <file_name>

# 运行 Docker 容器
docker run <image_name>

# 创建 Docker 网络
docker network create <network_name>

# 将容器连接到网络
docker network connect <network_name> <container_name>

# 进入正在运行的容器的终端
docker exec -it <container_name> bash
```

## 3. MySQL 相关指令

```sql
# 登录 MySQL
mysql -u root -p

# 手动启动 MySQL 服务（在容器内）
mysqld

# 显示所有数据库
SHOW DATABASES;

# 选择数据库
USE <database_name>;

# 显示所有表
SHOW TABLES;

# 显示 MySQL 用户
SELECT user, host FROM mysql.user;

# 显示用户权限
SHOW GRANTS FOR '<user>'@'%';

# 删除用户
DROP USER 'qzj'@'%';

# 创建用户并分配密码
CREATE USER 'qzj'@'%' IDENTIFIED BY 'db123456';

# 授予 MySQL 用户权限
GRANT ALL PRIVILEGES ON `docker_mysql_quickstart`.* TO 'qzj'@'%';
FLUSH PRIVILEGES;
```

## 4. Django 相关指令

```bash
# 应用迁移
python manage.py makemigrations
python manage.py migrate

# 查看迁移状态
python manage.py showmigrations

# 启动 Django 开发服务器
python manage.py runserver

# 进入django容器
docker-compose exec django /bin/bash

# 创建超级用户
python manage.py createsuperuser

# 进入 Django shell 并执行命令
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.filter(username='<username>').update(password='<hashed_password>')"

# 在 Django 容器内测试与 MySQL 容器的网络连接
ping <mysql_container_ip>
```

## 5. 文件操作和权限

```bash
# 使用 SCP 传输文件
scp -i <key_file> <local_file> <remote_user>@<remote_host>:<remote_path>

# 修改文件权限
chmod +x <file_name>
```

docker network rm mynetwork
docker network create mynetwork
docker network connect mynetwork mysql-mysql-1;
docker network inspect mynetwork
python mysite/manage.py createsuperuser