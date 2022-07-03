#!/bin/bash
# Run 'travis lint' before accepting a git commit

config_path="$(git rev-parse --show-toplevel)/.circleci/config.yml"

if [ ! -f "$config_path" ]; then
    exit 0
fi

circleci_path="$(/usr/bin/which circleci)"
if [ ! -x "$circleci_path" ]; then
    echo "[WARN] CircleCI CLI not installed or not in PATH; skipping pre-commit hook 'circleci config validate'"
    exit 0
fi

circleci config validate "$config_path"
