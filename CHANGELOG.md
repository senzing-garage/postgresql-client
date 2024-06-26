# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.2.4] - 2024-06-24

### Changed in 2.2.3

- In `Dockerfile`, updated FROM instruction to `alpine:3.18.4@sha256:af4785ccdbcd5cde71bfd5b93eabd34250b98651f19fe218c91de6c8d10e21c5`

## [2.2.3] - 2023-09-30

### Changed in 2.2.3

- In `Dockerfile`, updated FROM instruction to `alpine:3.18.4@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978`

## [2.2.2] - 2023-05-11

### Changed in 2.2.2

- In `Dockerfile`, updated FROM instruction to `alpine:3.17.3@sha256:124c7d2707904eea7431fffe91522a01e5a861a624ee31d03372cc1d138a3126`

## [2.2.1] - 2022-09-29

### Changed in 2.2.1

- In `Dockerfile`, updated FROM instruction to `alpine:3.16.2@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad`

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
