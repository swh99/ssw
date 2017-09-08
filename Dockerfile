FROM alpine:3.6

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300
ENV DNS_ADDR 114.114.115.115
ENV DNS_ADDR_2 8.8.4.4
ARG BRANCH=manyuser
ARG WORK=~
RUN apk --no-cache add python \
    libsodium \
    wget
WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks
RUN mkdir -p $WORK && \
RUN wget -qO- --no-check-certificate https://github.com/shadowsocksr/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
