#!/usr/bin/env zsh

set -a
source $(dirname "${BASH_SOURCE[0]}")/projectname-env.sh
set +a

container_info=$(yc serverless container get $PACKAGE_NAME)
CONTAINER_ID=$(echo "$container_info" | awk '/^id:/ {print $2}')

if [[ -z "$CONTAINER_ID" ]]; then
  echo "ERROR: container id is empty"
  exit 1
fi
