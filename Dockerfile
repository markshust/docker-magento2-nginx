FROM nginx:1.9
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

ADD ./default.conf /etc/nginx/conf.d/

RUN usermod -u 501 nginx

WORKDIR /src
