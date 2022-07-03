#!/bin/bash

# need to break this out from the if statement, otherwise set -e won't cause an exit
result=$(git rev-parse --abbrev-ref HEAD &>/dev/null)
if [ $? -eq 128 ]; then
    echo "No commits yet"
    exit 0
fi

result=$(git rev-parse --abbrev-ref HEAD)
remote_url="$(git config remote.origin.url)"

if [[ "$result" == "master" ]] || [[ "$result" == "main" ]]; then
    # Only prevent committing on master/main if not on our own repo
    if [[ ! $(git config remote.origin.url) == *$(git config github.user)* ]] || [[ "$remote_url" == "" ]]; then
        echo "Cannot commit on ${result} (bypass with -n or --no-verify)"
        exit 1
    fi
fi
