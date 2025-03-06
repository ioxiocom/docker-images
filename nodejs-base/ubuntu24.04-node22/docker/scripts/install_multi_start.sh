#!/usr/bin/env bash

# shellcheck disable=SC2039
set -exuo pipefail

# Install pipx
apt-get update
apt-get install -y \
    pipx
export PATH="/root/.local/bin:$PATH"

# Install multi-start and make it available for all users
PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install multi-start
