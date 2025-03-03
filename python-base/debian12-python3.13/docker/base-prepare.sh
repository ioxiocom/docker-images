#!/usr/bin/env bash
#
# WARNING!
# ========
#
# THIS FILE IS NOT USED IN RUNTIME, ONLY WHILE BUILDING DOCKER IMAGES
# DO NOT ADD ANYTHING RUNTIME OR ENVIRONMENT SPECIFIC HERE
#
# This file is for installing the larger dependencies that rarely change such
# as OS packages, utilities and so on, for the build environment
#

# shellcheck disable=SC2039
set -exuo pipefail

bash /src/docker/scripts/create_user.sh

apt-get update
apt-get upgrade -y
apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  git \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxmlsec1-dev \
  tk-dev \
  xz-utils \
  zlib1g-dev \
# This line is intentionally empty to preserve trailing \ in previous list

bash /src/docker/scripts/install_python.sh
bash /src/docker/scripts/prepare_workon_dir.sh
bash /src/docker/scripts/install_poetry.sh
bash /src/docker/scripts/install_multi_start.sh

# Allow the next script to run as ${USER}
chown -R "${USER}":"${GROUP}" /src

# Cleanup
apt-get remove -y \
  build-essential \
  git \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxmlsec1-dev \
  tk-dev \
  xz-utils \
  zlib1g-dev \
# This line is intentionally empty to preserve trailing \ in previous list

apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /root/.cache
rm -rf /usr/share/doc
