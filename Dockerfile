FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="zyzh0 zyzh02@gmail.com"

WORKDIR /root
ARG TARGETPLATFORM
ARG TAG
COPY xray.sh /root/xray.sh

RUN set -ex \
    && apk add --no-cache tzdata openssl ca-certificates \
    && mkdir -p /etc/xray /usr/local/share/xray /var/log/xray \
    # forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/v2ray/access.log \
    && ln -sf /dev/stderr /var/log/v2ray/error.log \
    && chmod +x /root/xray.sh \
    && /root/xray.sh "${TARGETPLATFORM}" "${TAG}"

ENTRYPOINT ["/usr/bin/xray"]
