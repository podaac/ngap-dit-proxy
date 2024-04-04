# ngap-dit-proxy

An Nginx-based reverse proxy for implementing HTTPS with auto-renewing
certificates provided by the NGAP private CA

## Environment variables

To run this container, you must set the following environment variables:

| Variable             | Description                                      |
|----------------------|--------------------------------------------------|
| HOSTNAME             | The hostname of the certificate generated        |
| NGAP_CERTIFICATE_ARN | The ARN of the certificate to use for this proxy |
| APP_PORT             | The local HTTP port to reverse proxy as HTTPS    |
