# postgresql-client

## Overview

### Contents

1. [Expectations](#expectations)
1. [Demonstrate using Docker](#demonstrate-using-docker)
1. [Demonstrate using docker-compose](#demonstrate-using-docker-compose)
1. [References](#references)

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps you'll need to make some choices.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

## Expectations

- **Space:** This repository and demonstration require 6 GB free disk space.
- **Time:** Budget 40 minutes to get the demonstration up-and-running, depending on CPU and network speeds.
- **Background knowledge:** This repository assumes a working knowledge of:
  - [Docker](https://github.com/Senzing/knowledge-base/blob/main/WHATIS/docker.md)

## Demonstrate using Docker

1. :pencil2: Specify database.
   *Note:* `POSTGRES_HOST` cannot be "localhost".  It must be an IP address or a hostname that can be resolved.
   Example:

    ```console
    export POSTGRES_USERNAME=postgres
    export POSTGRES_PASSWORD=postgres
    export POSTGRES_HOST=senzing-postgresql
    export POSTGRES_PORT=5432
    export POSTGRES_DB=G2
    ```

1. Construct Database URL.
   Example:

    ```console
    export SENZING_DATABASE_URL="postgresql://${POSTGRES_USERNAME}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}"
    ```

1. List SQL files.
   *Note:* the example uses files that are "baked-in" the container.
   Any other SQL file must be on a mounted volume.
   Example:

    ```console
    export SENZING_SQL_FILES="/opt/senzing/g2/resources/schema/g2core-schema-postgresql-create.sql /app/insert-senzing-configuration.sql"
    ```

1. Run docker container.
   Example:

    ```console
    sudo docker run \
      --env SENZING_DATABASE_URL="${SENZING_DATABASE_URL}" \
      --env SENZING_SQL_FILES="${SENZING_SQL_FILES}" \
      --rm \
      senzing/postgresql-client
    ```

## Demonstrate using docker-compose

1. :pencil2: Specify database.
   *Note:* `POSTGRES_HOST` cannot be "localhost".  It must be an IP address or a hostname that can be resolved.
   Example:

    ```console
    export POSTGRES_USERNAME=postgres
    export POSTGRES_PASSWORD=postgres
    export POSTGRES_HOST=senzing-postgresql
    export POSTGRES_PORT=5432
    export POSTGRES_DB=G2
    ```

1. Bring up docker-compose formation.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    docker-compose up
    ```

## References

1. [Development](docs/development.md)
1. [Errors](docs/errors.md)
1. [Examples](docs/examples.md)
1. Related artifacts:
    1. [DockerHub](https://hub.docker.com/r/senzing/postgresql-client)
