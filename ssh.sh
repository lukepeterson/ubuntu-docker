#!/bin/bash

set -euxo pipefail

ssh -i ~/.ssh/id_ed25519.pub -p 2222 ubuntu@localhost