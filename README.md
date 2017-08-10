# Git hooks

Note: This directory should either be located at `~/.git-templates` or you need to set your [git template directory](https://git-scm.com/docs/git-init#_template_directory).

## Pre-commit hooks

This repo contains the following pre-commit hooks:

- Don't allow committing directly to master unless we're the owners of the `origin` repo (hackish check)
- Run spell check on newly committed lines
- Run `shellcheck` on new or modified `.sh` files
- Run `shellfmt` on new or modified `.sh` files

## To do

- Interactive prompt to override checks
