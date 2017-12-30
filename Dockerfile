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

# Add mysql
#ENV DEBIAN_FRONTEND=noninteractive
#RUN echo "mysql-server mysql-server/root_password password " | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password " | debconf-set-selections
#RUN apt-get -y install mysql-server mysql-client libmysqlclient-dev
#RUN mysql_secure_installation
