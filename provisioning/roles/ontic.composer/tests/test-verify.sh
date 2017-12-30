#!/bin/bash

# Verify the installed version of Composer.
docker exec --tty ${container_id} env TERM=xterm composer || true