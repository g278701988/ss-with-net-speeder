# shadowsocks-net-speeder

FROM ubuntu:14.04.3
RUN apt-get update && \
    apt-get install -y python-pip libsodium-dev

RUN pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U

RUN echo '{"server":"::", "server_port":8788, "local_address": "127.0.0.1", "local_port":1080, "password":"no@10wxhcgl", "timeout":300, "method":"chacha20-ietf-poly1305", "fast_open": true }' > /etc/shadowsocks.json

RUN ssserver -c /etc/shadowsocks.json -d start

