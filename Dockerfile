ARG BASE_IMAGE=alpine:3.19.1@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2024-03-18

LABEL Name="senzing/postgresql-client" \
  Maintainer="support@senzing.com" \
  Version="2.2.3"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apk.

RUN apk --update add postgresql-client \
  && rm -rf /var/cache/apk/*

# Copy files from repository.

COPY ./rootfs /

USER 1001

# Runtime execution.

WORKDIR /app
CMD ["/app/wait-and-run-postgres-client.sh"]
