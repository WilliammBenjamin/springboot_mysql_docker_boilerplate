#!/usr/bin/env bash

set -e

/scripts/wait-for-it.sh -h $DB_HOST -p $DB_PORT -t 300

exec "$@"






