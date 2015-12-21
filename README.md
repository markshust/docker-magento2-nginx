# Versions

- [`1.9.9-0` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-nginx/tree/1.9.9-0/Dockerfile)

# Description

This image is built from [`nginx`](https://hub.docker.com/_/nginx/) and contains the default webserver configuration for Magento 2.

# What's in this image?

This image installs the following:

- `nginx`

# How to use this image?

This image will work out-of-the-box with linux-based systems.

To use this image on other systems for local development, creating a Dockerfile in the root of your project with anything specific to your local development platform.

For example, if using [Dinghy](https://github.com/codekitchen/dinghy) on OS X, use:

```
FROM mageinferno/magento2-nginx:[TAG]
RUN usermod -u 501 www-data
```

Then build your custom image:

```
docker build -t myname/foobar .
```

# Docker Compose

Please see [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose) for more detailed instructions and an example development environment using Docker Compose.
