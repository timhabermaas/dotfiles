#! /usr/bin/env bash

set -e

GIT_REMOTE="$(git remote get-url origin)"
GIT_REPO_LINK="https://$(echo $GIT_REMOTE | sed 's/^git@//' | sed 's/:/\//' | sed 's/.git$//')"
GIT_COMMIT_SHA=$(git rev-parse HEAD)
GITHUB_LINK="$GIT_REPO_LINK/blob/$GIT_COMMIT_SHA/$1#L$2-L$3"

echo $GITHUB_LINK | pbcopy

if command -v pbcopy >/dev/null 2>&1; then
    # macOS
    printf "%s" "$GITHUB_LINK" | pbcopy
elif command -v xclip >/dev/null 2>&1; then
    # Linux with xclip
    printf "%s" "$GITHUB_LINK" | xclip -selection clipboard
elif command -v xsel >/dev/null 2>&1; then
    # Linux with xsel
    printf "%s" "$GITHUB_LINK" | xsel --clipboard --input
else
    echo "No clipboard tool found. Install pbcopy (macOS), xclip or xsel (Linux)." >&2
    exit 1
fi
