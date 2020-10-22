FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="charlieethan <admin@charlieethan.com>"

WORKDIR /root
ARG TARGETPLATFORM
COPY v2ray.sh /root/v2ray.sh
COPY config.json /etc/v2ray/config.json
RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates \
	&& mkdir -p /var/log/v2ray \
	&& chmod +x /root/v2ray.sh \
	&& /root/v2ray.sh "${TARGETPLATFORM}" \
	&& rm -fv /root/v2ray.sh \
	&& wget -O /usr/bin/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat \
	&& wget -O /usr/bin/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat

VOLUME /etc/v2ray
ENV TZ=Asia/Shanghai
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]
