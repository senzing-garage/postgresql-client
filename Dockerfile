ARG BASE_IMAGE=alpine:3.16.2@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-08-12

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
