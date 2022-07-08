# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.2.0] - 2022-07-08

### Changed in 2.2.0

- Added ability to specify `SENZING_SQL_FILES`
- Improved documentation

## [2.1.0] - 2022-06-08

### Changed in 2.1.0

- Upgrade `Dockerfile` to `FROM alpine:3.16.0@sha256:686d8c9dfa6f3ccfc8230bc3178d23f84eeaf7e457f36f271ab1acc53015037c`

## [2.0.2] - 2022-05-04

### Changed in 2.0.2

- Last release supporting `senzingdata-v2`.

## [2.0.1] - 2021-04-07

### Changed in 2.0.1

- Updated Senzing configurations in `sys_cfg` and `sys_vars`.

## [2.0.0] - 2021-04-06

### Added to 2.0.0

- Change from Senzing V2 to Senzing V3 database schema

## [1.1.3] - 2021-04-01

### Added to 1.1.3

- Updated to alpine 3.15.3

## [1.1.2] - 2021-10-11

### Added to 1.1.2

- Updated to alpine 3.14.2

## [1.1.1] - 2021-08-17

### Added to 1.1.1

- Added to `/app/insert-senzing-configuration.sql`
  - Insert into SYS_VARSs

## [1.1.0] - 2021-08-11

### Added to 1.1.0

- Baked in files:
  - /opt/senzing/g2/resources/schema/g2core-schema-postgresql-create.sql
  - /opt/senzing/g2/resources/schema/License
  - /app/insert-senzing-configuration.sql

## [1.0.0] - 2020-03-27

### Added to 1.0.0

- Initial release.
