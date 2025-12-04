ARG BASE_IMAGE=alpine:3.23.0@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2024-06-24

LABEL Name="senzing/postgresql-client" \
  Maintainer="support@senzing.com" \
  Version="2.2.4"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apk.

RUN apk --update --no-cache add postgresql-client \
  && rm -rf /var/cache/apk/*

# Copy files from repository.

COPY ./rootfs /

USER 1001

# Runtime execution.

WORKDIR /app
CMD ["/app/wait-and-run-postgres-client.sh"]
