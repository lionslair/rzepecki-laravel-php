This file contains instructions for how to build and update a docker image.

The main purpose of this image is for running bitbucket pipelines.

Update the commands in the Dockerfile or Ansible then RUN

`docker build -t rzepecki-laravel-php-7-2 .`

When you commit to the bitbucket repo it will then trigger the image to be rebuilt on dockerhub.

Run the container locally after building.

`docker run -i -t -P rzepecki-laravel-php-7-2:latest /lib/systemd/systemd`

## URLS
* [rzepecki-laravel-php-7-2@dockerhub](https://hub.docker.com/r/lionslair/rzepecki-laravel-php-7-2/)
* [Bitbucket repo](https://bitbucket.org/lionslair/rzepecki-laravel-php-7.2)

## OS image
* Ubuntu 18.04

## packages
* MySQL
* PHP 7.2
* phpunit
* sqlite
* git
* composer
* redis
* yarn
* chromedriver - webdriver
