# Versions

- [`1.9.9-2` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-nginx/tree/1.9.9-2/Dockerfile)

# Description

This image is built from [`nginx`](https://hub.docker.com/_/nginx/) and contains the default webserver configuration for Magento 2.

# What's in this image?

This image installs the following:

- `nginx`

# How to use this image?

This image will work out-of-the-box with Linux-based systems.

To use this image on other systems for local development, create Dockerfile with anything specific to your local development platform.

For example, if using [Dinghy](https://github.com/codekitchen/dinghy) on OS X, use:

```
FROM mageinferno/magento2-nginx:[TAG]
RUN usermod -u 501 www-data
```

Then build your custom image:

```
docker build -t myname/nginx .
```

# Variables

The following environment variables are used for Nginx configuration:

- `VIRTUAL_HOST`: (default: `''`) The server name of the virtual host.
- `PHP_HOST`: (default: `php-fpm`) The hostname of the PHP container.
- `PHP_PORT`: (default: `9000`) The port of the PHP container.
- `APP_MAGE_MODE`: (default: `default`) Set the appropriate MAGE_MODE.

# Docker Compose

Please see [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose) for more detailed instructions and an example development environment using Docker Compose.
