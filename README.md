# postgresql-client

## Overview

### Related artifacts

1. [DockerHub](https://hub.docker.com/r/senzing/xxxxxxxx)
1. [Helm Chart](https://github.com/Senzing/charts/tree/main/charts/xxxxxxxx)

### Contents

1. [Expectations](#expectations)
    1. [Space](#space)
    1. [Time](#time)
    1. [Background knowledge](#background-knowledge)
1. [Demonstrate using Docker](#demonstrate-using-docker)
1. [Demonstrate using docker-compose](#demonstrate-using-docker-compose)
1. [Develop](#develop)
    1. [Prerequisite software](#prerequisite-software)
    1. [Clone repository](#clone-repository)
    1. [Build docker image for development](#build-docker-image-for-development)
1. [Examples](#examples)
1. [Errors](#errors)
1. [References](#references)

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps you'll need to make some choices.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

## Expectations

### Space

This repository and demonstration require 6 GB free disk space.

### Time

Budget 40 minutes to get the demonstration up-and-running, depending on CPU and network speeds.

### Background knowledge

This repository assumes a working knowledge of:

1. [Docker](https://github.com/Senzing/knowledge-base/blob/main/WHATIS/docker.md)

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

## Develop

### Prerequisite software

The following software programs need to be installed:

1. [git](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/install-git.md)
1. [make](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/install-make.md)
1. [docker](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/install-docker.md)

### Clone repository

For more information on environment variables,
see [Environment Variables](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md).

1. Set these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=template-docker
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/clone-repository.md) to install the Git repository.

### Build docker image for development

1. **Option #1:** Using `docker` command and GitHub.

    ```console
    sudo docker build \
      --tag senzing/template \
      https://github.com/senzing/template-docker.git#main
    ```

1. **Option #2:** Using `docker` command and local repository.

    ```console
    cd ${GIT_REPOSITORY_DIR}
    sudo docker build --tag senzing/template .
    ```

1. **Option #3:** Using `make` command.

    ```console
    cd ${GIT_REPOSITORY_DIR}
    sudo make docker-build
    ```

    Note: `sudo make docker-build-development-cache` can be used to create cached docker layers.

## Examples

## Errors

1. See [docs/errors.md](docs/errors.md).

## References
