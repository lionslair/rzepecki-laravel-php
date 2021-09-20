This file contains instructions for how to build and update a docker image.

The main purpose of this image is for running bitbucket pipelines.

Update the commands in the Dockerfile or Ansible then RUN

`docker build -t rzepecki-laravel-php .`

When you commit to the bitbucket repo it will then trigger the image to be rebuilt on dockerhub.

Run the container locally after building.

`docker run -i -t -P lionslair/rzepecki-laravel-php:latest /lib/systemd/systemd`

## URLS
* [rzepecki-laravel-php@dockerhub](https://hub.docker.com/r/lionslair/rzepecki-laravel-php/)
* [Github repo](https://github.com/lionslair/rzepecki-laravel-php)

## OS image
* Ubuntu 20.04

## packages
* MySQL
* PHP 7.4 | PHP 8.0
* php-redis
* phpunit
* sqlite
* git
* composer
* redis
* yarn
* chromedriver - webdriver
* ffmpeg
