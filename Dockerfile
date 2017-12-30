FROM ubuntu:16.04
MAINTAINER Nathan Rzepecki <nathan@lionslair.net.au>

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python-software-properties \
       software-properties-common \
       rsyslog systemd systemd-cron sudo \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf
#ADD etc/rsyslog.d/50-default.conf /etc/rsyslog.d/50-default.conf

# Install Ansible
RUN add-apt-repository -y ppa:ansible/ansible \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
     ansible \
  && rm -rf /var/lib/apt/lists/* \
  && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
  && apt-get clean


COPY initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

  # Install Ansible inventory file
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Copy provisioning directory, variable overrides, and scripts into container.
COPY ./ /etc/ansible/laravel-vm
COPY ./provisioning/docker/vars/docker-hub-overrides.yml /etc/ansible/laravel-vm/local.config.yml

# Provision Drupal VM inside Docker.
RUN ansible-playbook /etc/ansible/laravel-vm/provisioning/playbook.yml

CMD ["/lib/systemd/systemd"]

# add nginx
#RUN apt-get install -y nginx

# Add normal packages
#RUN apt-get install -y git curl wget zip unzip bzip2 tar less openssh-client gettext ruby python python3 perl memcached libzip-dev libmcrypt-dev apt-transport-https automake autoconf

# Add sqlite3
#RUN apt-get install -y sqlite libsqlite-dev

# Add mysql
#ENV DEBIAN_FRONTEND=noninteractive
#RUN echo "mysql-server mysql-server/root_password password " | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password " | debconf-set-selections
#RUN apt-get -y install mysql-server mysql-client libmysqlclient-dev
#RUN mysql_secure_installation

# Add repo for php 7.2 https://launchpad.net/~ondrej/+archive/ubuntu/php/+index?batch=75&memo=150&start=150
#RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
#RUN apt-get update -y

#install php 7.2
#RUN apt-get install -y php7.2 php7.2-bcmath php7.2-bz2 php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-fpm php7.2-gd php7.2-gmp php7.2-imap php7.2-intl php7.2-json php7.2-ldap php7.2-interbase php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-pgsql php7.2-pspell php7.2-readline php7.2-opcache php7.2-snmp php7.2-soap php7.2-xml php7.2-sqlite3 php7.2-sybase php7.2-tidy php7.2-xmlrpc php7.2-zip

# Other php modules
#RUN apt-get install -y php-redis

# add nodejs
#RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
#RUN apt-get install -y nodejs

# add composer
#RUN apt-get install -y composer

# add yarn
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get update && apt-get install -y yarn

# install phpunit
#run wget https://phar.phpunit.de/phpunit-6.5.phar
#RUN chmod +x phpunit-6.5.phar
#RUN mv phpunit-6.5.phar /usr/local/bin/phpunit
