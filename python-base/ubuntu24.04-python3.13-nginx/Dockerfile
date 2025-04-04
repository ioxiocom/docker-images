ARG LOCAL_REGISTRY=""
FROM ${LOCAL_REGISTRY}python-base:ubuntu24.04-python3.13

ENV \
    PARSE_TEMPLATE_HASH="dcfbc9e843292664aab43cd942694019ae566dc6ab83567f4339e942da76360b" \
    PARSE_TEMPLATE_VERSION="v1.0.1" \
    ENV_LAST_LINE="LEAVE-ME-HERE"

# Run docker/base-prepare.sh
WORKDIR /src/
COPY docker /src/docker
RUN : \
 && set -exu \
 && bash /src/docker/base-prepare.sh \
 && rm -rf /src/docker \
 && :
