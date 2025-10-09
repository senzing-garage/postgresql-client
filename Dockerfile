ARG BASE_IMAGE=alpine:3.22.2@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
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
