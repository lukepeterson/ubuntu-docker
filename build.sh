#!/bin/bash

set -euxo pipefail

PUBLIC_KEY=$(cat ~/.ssh/id_ed25519.pub)
docker build --build-arg PUBLIC_KEY="$PUBLIC_KEY" -t ubuntu-docker .