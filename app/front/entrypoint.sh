#!/bin/bash
#set -euo pipefail

# assigns a default value
: "${WS_BACK_URL:=http://localhost:8080}"

echo "Will start Nginx with the following configuration:"
echo "  - WS_BACK_URL : $WS_BACK_URL"
sed -i "s@TR_WS_BACK_URL@$WS_BACK_URL@" /usr/share/nginx/html/index.html

# docker-entrypoint != entrypoint & generated by docker
exec /docker-entrypoint.sh nginx -g "daemon off;"
