#!/usr/bin/env bash
# Auto-format files after Claude edits them
# Hook trigger: PostToolUse (Edit/Write)
#
# Receives the file path as $1
# Detects the appropriate formatter and runs it

FILE="$1"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
    exit 0
fi

EXT="${FILE##*.}"

case "$EXT" in
    js|jsx|ts|tsx|json|css|scss|md|html|yaml|yml)
        if command -v prettier &>/dev/null; then
            prettier --write "$FILE" 2>/dev/null
        fi
        ;;
    go)
        if command -v gofmt &>/dev/null; then
            gofmt -w "$FILE" 2>/dev/null
        fi
        ;;
    py)
        if command -v black &>/dev/null; then
            black --quiet "$FILE" 2>/dev/null
        elif command -v ruff &>/dev/null; then
            ruff format "$FILE" 2>/dev/null
        fi
        ;;
    lua)
        if command -v stylua &>/dev/null; then
            stylua "$FILE" 2>/dev/null
        fi
        ;;
    sh|bash|zsh)
        if command -v shfmt &>/dev/null; then
            shfmt -w -i 4 "$FILE" 2>/dev/null
        fi
        ;;
    rs)
        if command -v rustfmt &>/dev/null; then
            rustfmt "$FILE" 2>/dev/null
        fi
        ;;
esac
