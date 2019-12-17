# shadowsocks-net-speeder

FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y python-pip libsodium-dev

RUN pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U

RUN echo '{"server":"::", "server_port":8788, "local_address": "127.0.0.1", "local_port":1080, "password":"no@10wxhcgl", "timeout":300, "method":"chacha20-ietf-poly1305", "fast_open": true }' > /etc/shadowsocks.json

ENTRYPOINT ["ss-server", "-c", "/etc/shadowsocks.json"]

