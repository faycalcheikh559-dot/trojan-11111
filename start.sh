#!/bin/sh

/usr/local/v2ray/v2ray -config /etc/v2ray/config.json &

nginx -g "daemon off;"
