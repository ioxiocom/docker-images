ARG LOCAL_REGISTRY=""
FROM ${LOCAL_REGISTRY}python-base:ubuntu24.04-python3.13-nginx

# Run docker/base-prepare.sh
WORKDIR /src/
COPY docker /src/docker
RUN : \
 && set -exu \
 && bash /src/docker/base-prepare.sh \
 && rm -rf /src/docker \
 && :
