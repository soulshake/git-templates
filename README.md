# Git hooks

Note: This directory should either be located at `~/.git-templates` or you need to set your [git template directory](https://git-scm.com/docs/git-init#_template_directory).

## Installation

`git clone --recursive git@github.com:soulshake/git-templates.git ~/.git-templates`

To get these templates in your existing repos, you can delete the repository's `.git/hooks` directory and run `git init` again to pull the new hooks in `~/.git-templates/hooks`.

## Pre-commit hooks

This repo contains the following pre-commit hooks:

- Don't allow committing directly to master unless we're the owners of the `origin` repo (hackish check)
- Run spell check on newly committed lines
- Run `shellcheck` on new or modified `.sh` files
- Run `shellfmt` on new or modified `.sh` files

**Note:** You can bypass pre-commit hooks by passing the `-n` (`--no-verify`) to `git commit`.

You can disable a hook by removing the file from your repository's `.git/hooks/pre-commit.d/` directory or appending any extension other than `.sh`.

## To do

- Interactive prompt to override checks
