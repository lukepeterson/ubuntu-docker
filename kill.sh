#!/bin/bash

set -uxo pipefail

docker ps -a --filter ancestor=ubuntu-docker --format "{{.ID}}" | xargs docker kill
docker ps -a --filter ancestor=ubuntu-docker --format "{{.ID}}" | xargs docker rm
docker ps -a