ARG LOCAL_REGISTRY=""
FROM ${LOCAL_REGISTRY}python-base:ubuntu22.04-python3.11

ENV \
    PARSE_TEMPLATE_HASH_X86_64="dcfbc9e843292664aab43cd942694019ae566dc6ab83567f4339e942da76360b" \
    PARSE_TEMPLATE_HASH_ARM64="d305ac32e970bf12572e67e5aa09e202b2b49279a4aaa81000bb7ae94b179648" \
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
