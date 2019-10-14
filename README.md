## sentry-cli-docker [![CircleCI](https://circleci.com/gh/Rochet2/sentry-cli-docker.svg?style=svg)](https://circleci.com/gh/Rochet2/sentry-cli-docker) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/rochet2/sentry-cli-docker)](https://circleci.com/orbs/registry/orb/rochet2/sentry-cli-docker)

## Usage

```
version: 2.1

orbs:
  sentry-cli-docker: rochet2/sentry-cli-docker@volatile

executors:
  my-executor:
    working_directory: ~/app
    machine:
      image: ubuntu-1604:201903-01

jobs:
  build:
    executor: my-executor
    steps:
      - checkout
      - run:
          name: Set up an example container that contains things to release with sentry
          command: |
            docker build -t foo .
            docker run -d foo
            sleep 1
      - sentry-cli-docker/install:
          container: foo
      - sentry-cli-docker/releasefinalize:
          container: foo
          sentry_auth_token: yourtokenyourtokenyourtoken
          sentry_org: yourorg
          sentry_project: yourproject
          version: yourversionstring

workflows:
  version: 2
  build:
    jobs:
      - build:
          filters:
            tags:
              only: /.*/

```

## Commands

## Help

