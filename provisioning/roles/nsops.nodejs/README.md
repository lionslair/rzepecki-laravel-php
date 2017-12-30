# Ansible: IntelliJ IDEA Community

[![Build Status](https://travis-ci.org/nsops/ansible-nodejs.svg?branch=master)](https://travis-ci.org/nsops/ansible-nodejs) [![Ansible Galaxy](http://img.shields.io/badge/galaxy-nsops.nodejs-blue.svg?style=flat)](https://galaxy.ansible.com/nsops/nodejs/)

Install NodeJS and NPM in Ubuntu

### Requirements
None

### Variables
- ```node_version```

NodeJS version to install ("0.10", "0.12", "5.x", "6.x").

- ```npm_prefix```

Directory for global installation

### Dependencies
None

### Usage
```yaml
- hosts: all
  role:
    - { name: nsops.nodejs }
```

```yaml
- hosts: all
  role:
    - { name: nsops.nodejs, version: "6.x" }
```