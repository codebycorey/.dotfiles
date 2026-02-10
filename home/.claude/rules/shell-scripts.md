---
description: Shell script conventions
paths: ["**/*.sh", "home/.config/shell/*", "home/.zshrc", "home/.zshenv"]
---

# Shell Script Conventions

- Use `#!/usr/bin/env bash` for bash scripts, `#!/usr/bin/env zsh` for zsh configs
- Quote all variable expansions: `"$var"` not `$var`
- Use `[[ ]]` over `[ ]` for conditionals
- Use `$(command)` over backticks for command substitution
- Indent with 4 spaces
- Use `set -e` in bash scripts (fail on errors)
- Check if commands exist before using them: `command -v foo &>/dev/null`
- Use `local` for function variables
- Redirect stderr to /dev/null for optional commands: `cmd 2>/dev/null || true`
