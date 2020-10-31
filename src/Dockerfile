FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="charlieethan <admin@charlieethan.com>"

WORKDIR /root
ARG TARGETPLATFORM
COPY v2ray.sh /root/v2ray.sh

RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates \
	&& mkdir -p /etc/v2ray /var/log/v2ray \
	&& chmod +x /root/v2ray.sh \
	&& /root/v2ray.sh "${TARGETPLATFORM}"

VOLUME /etc/v2ray
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]