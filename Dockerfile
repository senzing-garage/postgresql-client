ARG BASE_IMAGE=alpine:3.18.2@sha256:82d1e9d7ed48a7523bdebc18cf6290bdb97b82302a8a9c27d4fe885949ea94d1
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2023-06-15

LABEL Name="senzing/postgresql-client" \
      Maintainer="support@senzing.com" \
      Version="2.2.1"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apk.

RUN apk --update add postgresql-client \
 && rm -rf /var/cache/apk/*

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /app
CMD ["/app/wait-and-run-postgres-client.sh"]
