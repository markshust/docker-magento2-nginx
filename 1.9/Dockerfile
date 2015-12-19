FROM nginx:1.9
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

ADD ./default.conf /etc/nginx/conf.d/

RUN useradd -p $(openssl passwd -1 magento) magento \
  && adduser magento www-data \
  && usermod -u 501 www-data

WORKDIR /src
