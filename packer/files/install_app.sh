#!/bin/bash

apt-get update
apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

sudo /usr/local/bin/puma -d
