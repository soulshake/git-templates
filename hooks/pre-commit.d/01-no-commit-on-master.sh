#!/bin/bash

# need to break this out from the if statement, otherwise set -e won't cause an exit
result=$(git rev-parse --abbrev-ref HEAD &> /dev/null)
if [ $? -eq 128 ]; then
    echo "No commits yet"
    exit 0
fi

result=$(git rev-parse --abbrev-ref HEAD)

if [[ "$result" == "master" ]]; then
    # Only prevent committing on master if not on our own repo or if there is no remote
    remote_url="$(git config remote.origin.url)"
    if [[ "$remote_url" == *$(git config github.user)* ]] || [[ "$remote_url" == "" ]]; then
      echo "ok to commit"
    else
      echo "Cannot commit on master (bypass with -n or --no-verify)"
      exit 1
    fi
fi
