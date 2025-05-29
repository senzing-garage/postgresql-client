# postgresql-client

If you are beginning your journey with [Senzing],
please start with [Senzing Quick Start guides].

You are in the [Senzing Garage] where projects are "tinkered" on.
Although this GitHub repository may help you understand an approach to using Senzing,
it's not considered to be "production ready" and is not considered to be part of the Senzing product.
Heck, it may not even be appropriate for your application of Senzing!

## Overview

### Contents

1. [Expectations]
1. [Demonstrate using Docker]
1. [Demonstrate using docker-compose]
1. [References]

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps there are some choices to be made.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

### Expectations

- **Space:** This repository and demonstration require 6 GB free disk space.
- **Time:** Budget 40 minutes to get the demonstration up-and-running, depending on CPU and network speeds.
- **Background knowledge:** This repository assumes a working knowledge of:
  - [Docker]

## Demonstrate using Docker

1. :pencil2: Specify database.
   _Note:_ `POSTGRES_HOST` cannot be "localhost". It must be an IP address or a hostname that can be resolved.
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
   _Note:_ the example uses files that are "baked-in" the container.
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
   _Note:_ `POSTGRES_HOST` cannot be "localhost". It must be an IP address or a hostname that can be resolved.
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

1. [Development]
1. [Errors]
1. [Examples]
1. Related artifacts:
   1. [DockerHub]

[Demonstrate using docker-compose]: #demonstrate-using-docker-compose
[Demonstrate using Docker]: #demonstrate-using-docker
[Development]: docs/development.md
[Docker]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/docker.md
[DockerHub]: https://hub.docker.com/r/senzing/postgresql-client
[Errors]: docs/errors.md
[Examples]: docs/examples.md
[Expectations]: #expectations
[References]: #references
[Senzing Garage]: https://github.com/senzing-garage
[Senzing Quick Start guides]: https://docs.senzing.com/quickstart/
[Senzing]: https://senzing.com/
