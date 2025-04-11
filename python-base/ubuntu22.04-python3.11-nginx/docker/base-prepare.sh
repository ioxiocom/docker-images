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

# Install system dependencies
apt-get update
apt-get install -y --no-install-recommends \
  nginx \
  curl \
# This line is intentionally empty to preserve trailing \ in previous list

# Install parse-template
ARCH=$(uname -m)
curl -L -o /usr/bin/parse-template \
      "https://github.com/cocreators-ee/parse-template/releases/download/${PARSE_TEMPLATE_VERSION}/parse-template_Linux_${ARCH}"
if [ "${ARCH}" = "x86_64" ]; then
  echo "${PARSE_TEMPLATE_HASH_X86_64}  /usr/bin/parse-template" | sha256sum -c
elif [ "${ARCH}" = "arm64" ] || [ "${ARCH}" = "aarch64" ]; then
  echo "${PARSE_TEMPLATE_HASH_ARM64}  /usr/bin/parse-template" | sha256sum -c
else
  echo "Unsupported architecture: ${ARCH}"
  exit 1
fi
chmod +x /usr/bin/parse-template

# ---------------
# Nginx configuration
# ---------------
# This is where logs will be stored. It should be accessible by ${USER}
mkdir /run/nginx
chown -R "${USER}:${GROUP}" /run/nginx
# Make /var/lib/nginx/logs/error.log be accessible by ${USER}
# Somehow it's still being created, however `error_log` is set
chown -R "${USER}:${GROUP}" /var/lib/nginx /var/log/nginx
# Forward nginx errors to stderr
ln -sf /dev/stderr /run/nginx/error.log

# Clean up
apt-get remove -y \
  curl
apt-get clean
rm -rf /var/lib/apt/lists/*
