#!/bin/bash

echo "begin prettier"

if ! which prettier &>/dev/null; then
    echo "are you sure you have installed prettier?"
    exit 1
fi

files=$(git diff --cached --diff-filter=AM --name-only | sed "s|^|$(git rev-parse --show-toplevel)/|g" | xargs)
echo "checking files:"
echo "${files}" | xargs -n1
prettier --check --ignore-unknown ${files} || exit
