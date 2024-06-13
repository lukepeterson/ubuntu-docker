# Ubuntu in Docker (via SSH)

An Ubuntu server inside of a Docker container.

## Features
- SSH login only (password login disabled)
- Based on Noble Numbat (24.04)

## Usage
- `./build.sh` - Builds a new container - output to the `ubuntu-docker` image.
- `./run.sh` - Runs the container, binding a port on `2222:22`.
- `./ssh.sh` - SSH into the container, using `~/.ssh/id_ed25519.pub` as the public key.
- `./kill.sh` - Kills and removes the container called `ubuntu-docker`, ready for a restart.
- `./restart.sh` - Runs `kill`, `build` and `run` in order.