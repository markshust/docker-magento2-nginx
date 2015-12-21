FROM nginx:1.9.9
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

ADD ./default.conf /etc/nginx/conf.d/

RUN useradd -p $(openssl passwd -1 magento) magento \
  && usermod -a -G www-data magento \
  && usermod -a -G magento www-data

WORKDIR /src
