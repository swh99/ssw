# About shadowsocks of Docker
# 
# Version:1.0.0

FROM ubuntu:trusty
MAINTAINER coppy Dubu Qingfeng

ENV REFRESHED_AT 2016-10-10

RUN apt-get update && \
    apt-get install -y --force-yes -m python-pip python-m2crypto &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN pip install shadowsocks   

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
