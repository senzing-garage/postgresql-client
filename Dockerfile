ARG BASE_IMAGE=alpine:3.15.3@sha256:4edbd2beb5f78b1014028f4fbb99f3237d9561100b6881aabbf5acce2c4f9454
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-05-09

LABEL Name="senzing/postgresql-client" \
      Maintainer="support@senzing.com" \
      Version="2.0.1"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apk.

RUN apk --update add postgresql-client \
 && rm -rf /var/cache/apk/*

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /app
CMD ["/app/wait-and-run-postgres-client.sh"]
