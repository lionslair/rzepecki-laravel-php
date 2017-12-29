FROM ubuntu:16.04
MAINTAINER Nathan Rzepecki <nathan@lionslair.net.au>

RUN apt-get update && apt-get install -y

RUN apt-get install -y nginx


RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update -y

# Add normal packages
RUN apt-get install -y git curl wget zip unzip openssh-client software-properties-common gettext ruby python python3 perl memcached libzip-dev libmcrypt-dev

#install php 7.2
RUN apt-get install -y php7.2 php7.2-bcmath php7.2-bz2 php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-gd php7.2-imap php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-snmp
php7.2-xml php7.2-xmlrpc php7.2-zip

# add nodejs
RUN apt-get isntall -y nodejs

# add composer
RUN apt-get install -y composer

# add yarn
RUN apt-get install -y yarn
