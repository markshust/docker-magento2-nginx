FROM nginx:1.9.12
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

ENV PHP_HOST phpfpm
ENV PHP_PORT 9000
ENV APP_MAGE_MODE default

COPY ./nginx.conf /etc/nginx/
COPY ./default.conf /etc/nginx/conf.d/
COPY ./start.sh /usr/local/bin/start.sh

RUN openssl rand -base64 32 | useradd magento -p --stdin \
  && mkdir /src \
  && usermod -g www-data magento

WORKDIR /src

CMD ["/usr/local/bin/start.sh"]
