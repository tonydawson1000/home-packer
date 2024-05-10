#!/bin/bash -x

apt-get update
apt-get install -y nginx

echo $MY_ENV_VAR
