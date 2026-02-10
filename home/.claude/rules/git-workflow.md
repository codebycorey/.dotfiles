---
description: Git workflow conventions
---

# Git Workflow

- Use conventional commits: `type(scope): description`
  - Types: feat, fix, refactor, chore, docs, test, style, perf, ci, build
  - Scope is optional but preferred
  - Description uses imperative mood ("add" not "added")
- Keep commits atomic — one logical change per commit
- Never force push to main/master
- Never amend published commits
- Write commit messages that explain WHY the change was made
- Keep subject line under 72 characters
- Use the body for additional context when needed
