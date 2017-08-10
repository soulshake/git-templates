Place files in this directory as, for example, `.git/hooks/pre-commit.d/do-a-thing.sh`.

Files in `.git/hooks/pre-commit.d/` with a `.sh` extension will be executed prior to `git commit`.

To disable a given pre-commit hook for a specific repo, just delete the file in the local `.git` directory, or rename it so it doesn't end in `.sh`.
