#!/bin/bash

set -euxo pipefail

./kill.sh
./build.sh
./run.sh
