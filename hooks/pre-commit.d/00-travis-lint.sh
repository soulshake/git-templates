#!/bin/bash
# Run 'travis lint' before accepting a git commit

travis_yml_path="$(git rev-parse --show-toplevel)/.travis.yml"

if [ ! -f "$travis_yml_path" ]; then
    echo "$travis_yml_path not found; skipping pre-commit hook 'travis lint'"
    exit 0
fi

travis_path="$(/bin/which travis)"
if [ ! -x "$travis_path" ]; then
    echo "travis CLI not installed or not in PATH; skipping pre-commit hook 'travis lint'"
    exit 0
fi

travis lint --exit-code "$travis_yml_path"
