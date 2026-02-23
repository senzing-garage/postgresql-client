ARG BASE_IMAGE=alpine:3.23.3@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
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
