#!/usr/bin/env bash
# macOS notification when Claude Code needs attention
# Hook trigger: Notification event

osascript -e "display notification \"$1\" with title \"Claude Code\""
