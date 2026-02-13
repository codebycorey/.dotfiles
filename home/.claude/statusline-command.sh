#!/usr/bin/env bash
# Claude Code status line — shows model, git branch, and context usage
# Hook trigger: statusLine command

INPUT=$(cat)

MODEL=$(echo "$INPUT" | jq -r '.model.display_name // empty')
CWD=$(echo "$INPUT" | jq -r '.workspace.current_dir // empty')
USED_PCT=$(echo "$INPUT" | jq -r '.context_window.used_percentage // empty')

# Git branch (fast path — read HEAD directly to avoid git overhead)
BRANCH=""
if [ -n "$CWD" ] && [ -d "$CWD/.git" ]; then
    BRANCH=$(cd "$CWD" && git branch --show-current 2>/dev/null)
fi

PARTS=()

if [ -n "$MODEL" ]; then
    PARTS+=("$MODEL")
fi

if [ -n "$BRANCH" ]; then
    PARTS+=("$BRANCH")
fi

if [ -n "$USED_PCT" ]; then
    ROUNDED=$(printf "%.0f" "$USED_PCT")
    PARTS+=("${ROUNDED}% context")
fi

printf '%s' "$(IFS=' | '; echo "${PARTS[*]}")"
