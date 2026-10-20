#!/bin/bash
# Railway passes PORT environment variable
PORT="${PORT:-8080}"
sed -i "s/\"port\": 8080/\"port\": ${PORT}/g" /etc/xray/config.json

echo "Starting Xray on port ${PORT}..."
exec /usr/local/bin/xray/xray run -config /etc/xray/config.json
