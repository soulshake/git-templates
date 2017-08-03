#!/bin/bash

# need to break this out from the if statement, otherwise set -e won't cause an exit
result=$(git rev-parse --abbrev-ref HEAD &> /dev/null) 
if [ $? -eq 128 ]; then
    echo "No commits yet"
    exit 0
fi

set -e
result=$(git rev-parse --abbrev-ref HEAD)

if [[ "$result" == "master" ]]; then 
  echo "Cannot commit on master (bypass with -n or --no-verify)"
  exit 1
fi
