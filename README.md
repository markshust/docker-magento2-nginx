# Versions

- [`1.9`, `latest` (_Dockerfile_)](https://bitbucket.org/mageinferno/docker-magento2-nginx/src/master/1.9/Dockerfile)

# Description

This image is built from [`nginx`](https://hub.docker.com/_/nginx/) and contains the default webserver configuration for Magento 2.

The nginx configuration file is setup to run in tandem with `php-fpm` and `mysql` containers. It works really well with our PHP image [`mageinferno/magento2-php`](https://hub.docker.com/r/mageinferno/magento2-php), with contains the related PHP extensions and software needed to run Magento 2. The official `mysql` image works just fine with this image.

# What's in this image?

This image installs the following:

- `nginx`
- `vim`

The following line is included to run proper filesystem permissions when using ['Dinghy'](https://github.com/codekitchen/dinghy) on OS X.

`RUN usermod -u 501 www-data`

# How to use?

## Docker Compose

We created a [`docker-compose.yml`](https://bitbucket.org/mageinferno/magento2-docker-compose/src/master/docker-compose.yml) file with a default development environment setup for use with our Magento 2 Docker images.

Create a new folder to house your project, ex: `~/Sites/mysite`, then place your docker-compose.yml file within this directory.

Setup will create a new directory at `~/Sites/mysite/src` which will hold all of the source files for Magento 2.

## Composer Setup

This setup attaches the `~/.composer` directory from the host machine. For fully automated setup, please first setup a GitHub Personal Access Token for Composer (before running setup) by visiting: [https://github.com/settings/tokens/new?scopes=repo&description=Composer](https://github.com/settings/tokens/new?scopes=repo&description=Composer)

then, place your auth token on your host machine at `~/.composer/auth.json`
with the following contents, like so:

`{ "github-oauth": { "github.com": "PERSONAL_ACCESS_TOKEN_GOES_HERE" } }`

## Running Setup

Before running Magento 2, you must download the source code, install composer dependencies, and execute the Magento installer script. Luckily, Mage Inferno makes this easy for you.

The following environment variables can be set for setup:
```
      - M2SETUP_DB_HOST=db
      - M2SETUP_DB_NAME=magento2
      - M2SETUP_DB_USER=magento2
      - M2SETUP_DB_PASSWORD=magento2
      - M2SETUP_BASE_URL=http://mysite.docker/
      - M2SETUP_ADMIN_FIRSTNAME=Admin
      - M2SETUP_ADMIN_LASTNAME=User
      - M2SETUP_ADMIN_EMAIL=dummy@gmail.com
      - M2SETUP_ADMIN_USER=magento2
      - M2SETUP_ADMIN_PASSWORD=magento2
      - M2SETUP_USE_SAMPLE_DATA=true
      - M2SETUP_PULL_GITHUB=true
      - M2SETUP_PULL_COMPOSER=true
```

Our setup script uses these variables to determine how to setup your store. Everything is pretty self-explanatory, except the following:
*`M2SETUP_PULL_GITHUB`*: Setting this to `true` will download the latest stable Magento 2 code from the `master` branch, and check it out to your projects `src` directory. If you already have the code checked out from your host machine, set this to `false`.
*`M2SETUP_PULL_COMPOSER`*: Setting this to `true` will page through `composer.json` and install all composer dependencies to `src/vendor`. If you already have these installed, set this to `false`.

To run setup, execute the following command from your project directory (`~/Sites/mysite`), which creates a one-off throw away container that sets up Magento 2 for you.
`docker-compose run --rm setup`

Note that setup will take between 30 and 40 minutes to complete. A vast majority of this time is from downloading Composer dependencies, and installing sample data (configurable products, specifically). Setting `M2SETUP_USE_SAMPLE_DATA` to false will expedite the install process by skipping the installation of sample data.

## Data Volumes

This install will mount the `src` directory from your host machine to the Docker container (ex: `~/Sites/mysite/src`). Note that the persistancy comes from your host machine, so you may terminate running nginx/php containers and start them back up, and your data will remain. The `appdata` definition in the docker-compose.yml file is mainly there so we only have to define the relation in one place in the file, instead of it being defined multiple times.

For MySQL, the `mysqldata` container runs from the `tianon/true` volume. This makes a persistent Docker volume, however be aware that removing this container will remove all of your MySQL data (aka your database). Even though it appears as exited/stopped when running `docker ps -a`, be sure not to remove this container, as your MySQL data will truly go away if you remove it.

## App Virtual Host

This docker-compose file is catered to [Dinghy](https://github.com/codekitchen/dinghy), which uses it's own DNS Server and HTTP Proxy. Notice the `VIRTUAL_HOST=mysite.docker` definition for the `app` container. Dinghy uses this to create an HTTP Proxy, so your site can be access at [http://mysite.docker](http://mysite.docker). Note that all virtual names must end in `.docker` for proper DNS resolution by Dinghy.

## Running the stack

By default, you should place application code in `/src`, or attach a volume at that location. Our setup above links a volume from your host machine to the docker containers.

Once your `docker-compose.yml` file is setup, you can easily bring up the entire stack by running:

`docker-compose up -d app`