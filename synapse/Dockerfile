# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Installing packages
RUN \
  apk update \
  && apk add --no-cache \
    synapse \
    yq

WORKDIR /data

# Copy data for add-on
COPY rootfs /