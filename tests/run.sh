#!/bin/bash

set -e

TAG=${TAG:-$(cat .version)}
export TAG
docker compose -f tests/docker-compose.yaml up --abort-on-container-exit --exit-code-from analytics
ec=$?
docker compose -f tests/docker-compose.yaml down --remove-orphans
if [[ $ec -gt 0 ]]; then
    exit $ec
fi

docker compose  -f tests/docker-compose.yaml -f tests/r-docker-compose.yaml up --abort-on-container-exit --exit-code-from analytics
ec=$?
docker compose  -f tests/docker-compose.yaml -f tests/r-docker-compose.yaml down --remove-orphans

exit $ec
