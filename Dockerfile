FROM nginx:mainline-alpine-slim

LABEL org.opencontainers.image.source=https://github.com/podaac/ngap-dit-proxy
LABEL org.opencontainers.image.licenses=BSD-2-Clause

RUN set -x \
  && apk update \
  && apk add aws-cli cronie openssl

COPY --chmod=770 files/renew-cert.sh files/start-cron.sh /docker-entrypoint.d/
RUN ln -s /docker-entrypoint.d/renew-cert.sh /etc/periodic/daily/renew-cert.sh

COPY files/ssl-proxy.conf.template /etc/nginx/templates/
