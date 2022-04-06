ARG BASE_IMAGE=alpine:3.15.3@sha256:f22945d45ee2eb4dd463ed5a431d9f04fcd80ca768bb1acf898d91ce51f7bf04
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-04-06

LABEL Name="senzing/postgresql-client" \
      Maintainer="support@senzing.com" \
      Version="2.0.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apk.

RUN apk --update add postgresql-client \
 && rm -rf /var/cache/apk/*

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /app
CMD ["/app/wait-and-run-postgres-client.sh"]
