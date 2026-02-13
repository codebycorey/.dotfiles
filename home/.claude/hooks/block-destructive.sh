#!/usr/bin/env bash
# Block destructive commands before execution
# Hook trigger: PreToolUse (Bash)
#
# Reads hook input JSON from stdin, checks the command against
# a blocklist of dangerous patterns, and denies execution if matched.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [ -z "$COMMAND" ]; then
    exit 0
fi

PATTERNS=(
    'rm\s+-rf\s+/'
    'rm\s+-rf\s+~'
    'rm\s+-rf\s+\$HOME'
    'rm\s+-rf\s+\.\s*$'
    'git\s+push\s+.*--force'
    'git\s+push\s+-f\b'
    'git\s+reset\s+--hard'
    'git\s+checkout\s+\.\s*$'
    'git\s+clean\s+-f'
    'DROP\s+TABLE'
    'DROP\s+DATABASE'
    'TRUNCATE\s+TABLE'
)

for pattern in "${PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qEi "$pattern"; then
        cat <<EOF
{"decision":"deny","reason":"Blocked destructive command matching pattern: $pattern"}
EOF
        exit 0
    fi
done

exit 0
