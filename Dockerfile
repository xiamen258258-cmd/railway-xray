FROM alpine:latest

RUN apk add --no-cache curl unzip bash

# Download Xray-core
RUN LATEST_VERSION=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep "tag_name" | cut -d '"' -f 4) && \
    curl -L -H "Cache-Control: no-cache" -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/${LATEST_VERSION}/Xray-linux-64.zip && \
    mkdir -p /usr/local/bin/xray && \
    unzip /tmp/xray.zip -d /usr/local/bin/xray && \
    rm /tmp/xray.zip

COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
