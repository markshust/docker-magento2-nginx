FROM nginx:1.9
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

RUN apt-get update \
  && apt-get install -y \
    git \
    vim

ADD ./default.conf /etc/nginx/conf.d/

RUN usermod -u 501 nginx

WORKDIR /src
