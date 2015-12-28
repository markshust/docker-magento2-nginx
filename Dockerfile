FROM nginx:1.9.9
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

RUN useradd -p $(openssl passwd -1 magento) magento \
  && usermod -a -G www-data magento \
  && usermod -a -G magento www-data

ENV PHP_HOST php-fpm
ENV PHP_PORT 9000
ENV APP_MAGE_MODE default

WORKDIR /src

COPY ./default.conf /etc/nginx/conf.d/
COPY ./start.sh /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
