ARG BASE_IMAGE=alpine:3.11
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2020-03-26

LABEL Name="senzing/postgresql-client" \
      Maintainer="support@senzing.com" \
      Version="1.0.0"

# Install packages via apk.

RUN apk --update add postgresql-client \
 && rm -rf /var/cache/apk/*

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

# ENTRYPOINT [ "psql" ]
# ENTRYPOINT [ "pg_isready", "--timeout", "60" ]

WORKDIR /app
CMD ["/app/wait-and-run-postgres-client.sh"]
