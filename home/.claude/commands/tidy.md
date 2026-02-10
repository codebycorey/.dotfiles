---
description: Clean up code without changing functionality
allowed-tools: Read, Edit, Grep, Glob, Bash
argument-hint: file or directory path
---

Clean up code in the specified location without changing any functionality.

Target: $ARGUMENTS (defaults to currently modified files if empty)

If no argument given, find targets with `git diff --name-only` and `git diff --cached --name-only`.

Cleanup operations (apply only what's relevant):
- Remove unused imports/variables
- Fix inconsistent formatting (defer to project formatter if one exists)
- Simplify overly complex expressions
- Remove dead code (commented-out blocks, unreachable code)
- Fix obvious typos in comments and strings
- Normalize string quotes to match project style
- Remove trailing whitespace and fix line endings

Rules:
- Do NOT change behavior or logic
- Do NOT add new features or functionality
- Do NOT refactor architecture or rename public APIs
- Do NOT add comments, docstrings, or type annotations
- Preserve the existing code style of the project
- If a formatter config exists (.prettierrc, .editorconfig, etc.), respect it
- Make minimal, targeted changes
