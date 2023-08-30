#!/usr/bin/env bash
#leee
[[ "$SS_PASSWORD" ]] || {
	2>&1 echo "Empty shadowsocks password! Please set SS_PASSWORD environment variable."
	exec sleep infinity
}

exec ./go-shadowsocks2 \
	-s "ss://${SS_CIPHER:-AEAD_CHACHA20_POLY1305}:${SS_PASSWORD}@:${PORT}" \
	-verbose \
	-plugin v2ray-plugin \
	-plugin-opts "server;path=${V2_PATH:-/v2}"
