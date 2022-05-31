ARG BASE_IMAGE=alpine:3.16.0@sha256:sha256:686d8c9dfa6f3ccfc8230bc3178d23f84eeaf7e457f36f271ab1acc53015037c
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-05-16

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
