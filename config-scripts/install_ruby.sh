#!/bin/bash
apt update
# иначе падает ошибка по lock-frontend
echo "sleep 3m for install updates"; sleep 3m; echo "start install ruby"
apt install -y ruby-full ruby-bundler build-essential
