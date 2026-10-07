#! /usr/bin/env bash

set -e

# $1 is the buffer path as reported by helix, which is relative to helix's
# working directory (or absolute / ~-prefixed). Resolve it to a path relative
# to the root of the git repository containing the file.
FILE_PATH="$1"
case "$FILE_PATH" in
    "~/"*) FILE_PATH="$HOME/${FILE_PATH#\~/}" ;;
esac

cd "$(dirname "$FILE_PATH")"
FILE_NAME="$(basename "$FILE_PATH")"
# Path of the file's directory relative to the git root (empty at the root)
GIT_PREFIX="$(git rev-parse --show-prefix)"
GIT_FILE_PATH="$GIT_PREFIX$FILE_NAME"

GIT_REMOTE="$(git remote get-url origin)"

# Normalize the remote URL to a https:// web link.
# Supported forms:
#   git@host:owner/repo.git
#   ssh://git@host/owner/repo.git
#   https://host/owner/repo.git
#   https://user@host/owner/repo.git
GIT_REPO_PATH="$GIT_REMOTE"
# Strip scheme (https://, http://, ssh://, git://)
GIT_REPO_PATH="$(printf '%s' "$GIT_REPO_PATH" | sed -E 's#^[a-zA-Z][a-zA-Z0-9+.-]*://##')"
# Strip user@ prefix (git@, oauth tokens, ...)
GIT_REPO_PATH="$(printf '%s' "$GIT_REPO_PATH" | sed -E 's#^[^/@]*@##')"
# Turn scp-style host:path separator into a slash
GIT_REPO_PATH="$(printf '%s' "$GIT_REPO_PATH" | sed -E 's#^([^/:]+):#\1/#')"
# Strip trailing .git and slashes
GIT_REPO_PATH="$(printf '%s' "$GIT_REPO_PATH" | sed -E 's#/+$##; s#\.git$##')"

GIT_REPO_LINK="https://$GIT_REPO_PATH"
GIT_COMMIT_SHA=$(git rev-parse HEAD)
GITHUB_LINK="$GIT_REPO_LINK/blob/$GIT_COMMIT_SHA/$GIT_FILE_PATH#L$2-L$3"

if command -v pbcopy >/dev/null 2>&1; then
    # macOS
    printf "%s" "$GITHUB_LINK" | pbcopy
elif command -v xclip >/dev/null 2>&1; then
    # Linux with xclip
    # Redirect stdout to /dev/null to prevent shell hanging, see https://emacs.stackexchange.com/questions/39019/xclip-hangs-shell-command#comment61607_39023
    printf "%s" "$GITHUB_LINK" | xclip -selection clipboard &> /dev/null
elif command -v xsel >/dev/null 2>&1; then
    # Linux with xsel
    printf "%s" "$GITHUB_LINK" | xsel --clipboard --input
else
    echo "No clipboard tool found. Install pbcopy (macOS), xclip or xsel (Linux)." >&2
    exit 1
fi
