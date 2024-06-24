ARG BASE_IMAGE=alpine:3.19.2@sha256:af4785ccdbcd5cde71bfd5b93eabd34250b98651f19fe218c91de6c8d10e21c5
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2024-06-24

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
