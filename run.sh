#!/bin/bash

set -euxo pipefail

docker run -d -p 2222:22 --name ubuntu-docker ubuntu-docker
docker ps -a