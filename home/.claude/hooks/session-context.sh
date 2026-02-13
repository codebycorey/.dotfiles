#!/usr/bin/env bash
# Inject git context at session start
# Hook trigger: SessionStart

# Only run in git repos
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    exit 0
fi

BRANCH=$(git branch --show-current 2>/dev/null)
RECENT_COMMITS=$(git log --oneline -3 2>/dev/null)
CHANGES=$(git status --short 2>/dev/null)

cat <<EOF
--- Session Context ---
Branch: $BRANCH
Recent commits:
$RECENT_COMMITS
EOF

if [ -n "$CHANGES" ]; then
    echo ""
    echo "Uncommitted changes:"
    echo "$CHANGES"
fi

if [ -f .handoff.md ]; then
    echo ""
    echo ".handoff.md exists -- consider reading it to resume prior work"
fi

echo "---"
