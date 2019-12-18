FROM ubuntu:18.04
MAINTAINER Nathan Rzepecki <nathan@lionslair.net.au>

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       software-properties-common \
       rsyslog systemd systemd-cron sudo \
       curl wget less gettext \
       zip unzip bzip2 tar apt-utils \
       ruby python python3 perl gnupg  \
       memcached libzip-dev libmcrypt-dev \
       apt-transport-https automake autoconf \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf
#ADD etc/rsyslog.d/50-default.conf /etc/rsyslog.d/50-default.conf

#RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install The Chrome Web Driver & Dusk Utilities

# RUN add-apt-repository -y ppa:canonical-chromium-builds/stage \
#   && apt-get update \
#   && apt-get install -y --no-install-recommends \
#   libxpm4 libxrender1 libgtk2.0-0 \
#   libnss3 libgconf-2-4 chromium-browser \
#   xvfb gtk2-engines-pixbuf xfonts-cyrillic \
#   xfonts-100dpi xfonts-75dpi xfonts-base \
#   xfonts-scalable imagemagick x11-apps \
#   jpegoptim optipng pngquant gifsicle \
#   ffmpeg imagemagick ghostscript libpng-dev \
#   snmp snmp-mibs-downloader graphviz

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libxpm4 libxrender1 libgtk2.0-0 xdg-utils \
  libnss3 libgconf-2-4 gnupg \
  xvfb gtk2-engines-pixbuf xfonts-cyrillic \
  xfonts-100dpi xfonts-75dpi xfonts-base \
  xfonts-scalable imagemagick x11-apps \
  jpegoptim optipng pngquant gifsicle \
  ffmpeg imagemagick ghostscript libpng-dev \
  snmp snmp-mibs-downloader graphviz \
  fonts-liberation libappindicator3-1 libatk-bridge2.0-0 \
  libatspi2.0-0 libgtk-3-0 libxtst6 \
  && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && dpkg -i --force-depends google-chrome-stable_current_amd64.deb \
  && apt-get -y -f install \
  && dpkg -i --force-depends google-chrome-stable_current_amd64.deb \
  && rm google-chrome-stable_current_amd64.deb \
  && CHROMEVERSION=$(curl https://chromedriver.storage.googleapis.com/LATEST_RELEASE) \
  && wget https://chromedriver.storage.googleapis.com/$CHROMEVERSION/chromedriver_linux64.zip \
  && unzip chromedriver_linux64.zip \
  && mv chromedriver /usr/local/bin/ \
  && rm chromedriver_linux64.zip

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

# Get the roles
RUN ansible-galaxy install -r  /etc/ansible/laravel-vm/provisioning/requirements.yml

# Provision Ubuntu VM inside Docker.
RUN ansible-playbook /etc/ansible/laravel-vm/provisioning/playbook.yml

# one last item
RUN npm install -g svgo

CMD ["/lib/systemd/systemd"]
