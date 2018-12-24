#!/bin/bash

# helper
must() {
  if !(command -v "$1" >/dev/null 2>&1); then
    echo "$1 not installed, exiting..."
    exit 1
  fi
}

must git

for config in **/config.sh; do
  DIR=$(dirname "${config}") source ${config}
done
