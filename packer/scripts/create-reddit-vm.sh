#!/bin/bash
yc compute instance create \
  --name reddit-full \
  --hostname reddit-full \
  --create-boot-disk name=reddit-base-1688572965,image-id=fd8tm1gh6lrn4s4790g3 \
  --ssh-key ~/.ssh/appuser.pub \
  --public-ip
