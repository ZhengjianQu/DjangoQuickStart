#!/usr/bin/env bash
set -e

HOST="$1"
PORT="$2"
shift 2
cmd="$@"
echo "HOST: $HOST PORT: $PORT CMD: $cmd"
echo "Waiting for $HOST:$PORT to be available..."

# 循环检查主机和端口是否可用，使用netcat命令，并将输出重定向到/dev/null
while ! nc -z "$HOST" "$PORT" >/dev/null 2>&1; do
  sleep 1
done

echo "$HOST:$PORT is available!"
exec $cmd
