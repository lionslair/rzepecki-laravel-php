FROM ubuntu:16.04
MAINTAINER Nathan Rzepecki <nathan@lionslair.net.au>

RUN apt-get update && apt-get install -y

# add Nhinx
#RUN apt-get install -y nginx

# Add normal packages
RUN apt-get install -y software-properties-common python-software-properties git curl wget zip unzip openssh-client gettext ruby python python3 perl memcached libzip-dev libmcrypt-dev apt-transport-https

# Add repo for php 7.2 https://launchpad.net/~ondrej/+archive/ubuntu/php/+index?batch=75&memo=150&start=150
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update -y

#install php 7.2
RUN apt-get install -y php7.2 php7.2-bcmath php7.2-bz2 php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-gd php7.2-imap php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-snmp php7.2-xml php7.2-xmlrpc php7.2-zip

# add nodejs
RUN apt-get install -y nodejs

# add composer
RUN apt-get install -y composer

# add yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && sudo apt-get install -y yarn
