#!/bin/sh

set -xe
umask 177

openssl rand --base64 16 | tr -d '\n' > /etc/nginx/passphrase.txt
aws acm export-certificate \
  --certificate-arn $NGAP_CERTIFICATE_ARN \
  --passphrase fileb://etc/nginx/passphrase.txt \
  --query "[Certificate,CertificateChain,PrivateKey]" \
  --output text | sed -e "s/^\s*//g" > /etc/nginx/certificate.pem

if [ -f /var/run/nginx.pid ]; then
  nginx -s reload
fi
