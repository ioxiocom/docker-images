ARG LOCAL_REGISTRY=""
FROM ${LOCAL_REGISTRY}ubuntu-base:24.04

ENV \
    DEBIAN_FRONTEND="noninteractive" \
    GID=2000 \
    GROUP="api" \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ="UTC" \
    UID=2000 \
    USER="api" \
    ENV_LAST_LINE="LEAVE-ME-HERE"

# Run docker/base-prepare.sh
WORKDIR /src/
COPY docker /src/docker
RUN : \
 && set -exu \
 && bash /src/docker/base-prepare.sh \
 && rm -rf /src/docker \
 && :
