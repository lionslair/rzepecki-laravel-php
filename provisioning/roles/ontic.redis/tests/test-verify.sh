#!/bin/bash

# Verify the installed Redis version.
docker exec --tty ${container_id} env TERM=xterm redis-server --version

# Verify the Redis server information.
docker exec --tty ${container_id} env TERM=xterm redis-cli info server | egrep "process_id|tcp_port|config_file"