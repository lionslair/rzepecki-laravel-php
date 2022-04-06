This file contains instructions for how to build and update a docker image.

The main purpose of this image is for running bitbucket pipelines.

Update the commands in the Dockerfile or Ansible then RUN

`docker build -f Dockerfile-8.1 -t rzepecki-laravel-php-8.1 .`
`docker build -f Dockerfile-8.0 -t rzepecki-laravel-php-8.0 .`
`docker build -f Dockerfile-7.4 -t rzepecki-laravel-php-7.4 .`

When you commit to the github repo it will then trigger the image to be rebuilt on github actions and publish to docker hub.

Run the container locally after building.

`docker run -i -t -P lionslair/rzepecki-laravel-php:latest /lib/systemd/systemd`

## URLS
* [rzepecki-laravel-php@dockerhub](https://hub.docker.com/r/lionslair/rzepecki-laravel-php/)
* [Github repo](https://github.com/lionslair/rzepecki-laravel-php)

## OS image
* Ubuntu 20.04

## packages
* PHP 7.4 | PHP 8.0 | PHP 8.1
* php-redis
* phpunit
* sqlite
* git
* composer
* yarn
* chromedriver - webdriver
* ffmpeg
