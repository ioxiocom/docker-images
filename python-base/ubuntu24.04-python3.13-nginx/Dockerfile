FROM python-base:ubuntu24.04-python3.13

ENV \
    PARSE_TEMPLATE_HASH_X86_64="518e467ee3329815125f25c364ae899b1078d329e326d3cc7d2825ba2acdc9f2" \
    PARSE_TEMPLATE_HASH_ARM64="1c197e8a71397f65e97d99f7dd025c08839a48b50995f4f5b13600ae0de4221e" \
    PARSE_TEMPLATE_VERSION="v1.0.2" \
    ENV_LAST_LINE="LEAVE-ME-HERE"

# Run docker/base-prepare.sh
WORKDIR /src/
COPY docker /src/docker
RUN : \
 && set -exu \
 && bash /src/docker/base-prepare.sh \
 && rm -rf /src/docker \
 && :
