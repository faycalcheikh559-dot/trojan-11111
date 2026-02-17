FROM nginx:alpine

RUN apk add --no-cache wget unzip ca-certificates

RUN mkdir -p /etc/v2ray /usr/local/v2ray

# تحميل V2Ray
RUN wget -qO /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/v2ray/ && \
    rm -rf /tmp/v2ray.zip

COPY config.json /etc/v2ray/config.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh

RUN chmod +x /usr/local/v2ray/v2ray && chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
