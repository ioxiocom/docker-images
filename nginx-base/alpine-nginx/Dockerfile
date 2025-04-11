FROM nginx:stable-alpine

ENV PARSE_TEMPLATE_VERSION=v1.0.1 \
    PARSE_TEMPLATE_HASH_X86_64="dcfbc9e843292664aab43cd942694019ae566dc6ab83567f4339e942da76360b" \
    PARSE_TEMPLATE_HASH_ARM64="d305ac32e970bf12572e67e5aa09e202b2b49279a4aaa81000bb7ae94b179648"

RUN set -exu \
 && apk update \
 && apk upgrade --available \
 && apk add --virtual build-deps curl \
 && if [ "$(uname -m)" = "x86_64" ]; then \
        curl -L -o /usr/bin/parse-template "https://github.com/cocreators-ee/parse-template/releases/download/${PARSE_TEMPLATE_VERSION}/parse-template_Linux_x86_64" && \
        echo "${PARSE_TEMPLATE_HASH_X86_64}  /usr/bin/parse-template" | sha256sum -c; \
    elif [ "$(uname -m)" = "arm64" ] || [ "$(uname -m)" = "aarch64" ]; then \
        curl -L -o /usr/bin/parse-template "https://github.com/cocreators-ee/parse-template/releases/download/${PARSE_TEMPLATE_VERSION}/parse-template_Linux_arm64" && \
        echo "${PARSE_TEMPLATE_HASH_ARM64}  /usr/bin/parse-template" | sha256sum -c; \
    else \
        echo "Unsupported architecture: $(uname -m)" && \
        exit 1; \
    fi \
 && chmod +x /usr/bin/parse-template \
 && mkdir -p /run/nginx/ \
 && apk del build-deps \
 && rm /etc/nginx/conf.d/default.conf \
 && rm -rf /var/cache/apk \
 && :

ADD nginx.conf /etc/nginx/
