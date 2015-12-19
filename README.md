# Versions

- [`1.9`, `latest` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-nginx/blob/master/1.9/Dockerfile)

# Description

This image is built from [`nginx`](https://hub.docker.com/_/nginx/) and contains the default webserver configuration for Magento 2.

The nginx configuration file is setup to run in tandem with `php-fpm` and `mysql` containers. It works really well with our PHP image [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php), with contains the related PHP extensions and software needed to run Magento 2. The official `mysql` image works just fine with this image.

# What's in this image?

This image installs the following:

- `nginx`

A new `magento` user is created that belongs to the web server group, and the following line is included to run proper filesystem permissions when using ['Dinghy'](https://github.com/codekitchen/dinghy) on OS X:

`usermod -u 501 magento`

# How to use this image?

By default, you should place application code in `/src`, or attach a volume at that location.

Please see <a href="https://github.com/mageinferno/magento2-docker-compose" target="_blank">https://github.com/mageinferno/magento2-docker-compose</a> for more detailed instructions and an example development environment using Docker Compose.
