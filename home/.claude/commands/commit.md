---
description: Analyze staged changes and create a conventional commit
allowed-tools: Bash, Read, Grep
argument-hint: optional scope or context
---

Analyze the currently staged git changes and create a well-crafted conventional commit.

Steps:
1. Run `git diff --cached` to see staged changes
2. Run `git diff --cached --stat` for a summary
3. Run `git log --oneline -10` to match the repo's commit style
4. Analyze the changes and determine:
   - Type: feat, fix, refactor, chore, docs, test, style, perf, ci, build
   - Scope: the area of code affected (optional but preferred)
   - Description: concise summary of WHY the change was made
5. If the user provided an argument, use it as additional context: $ARGUMENTS
6. Create the commit with `git commit -m "type(scope): description"`

Rules:
- Use conventional commit format: type(scope): description
- Keep the subject line under 72 characters
- Focus on WHY, not WHAT (the diff shows what)
- Use imperative mood ("add" not "added")
- Do NOT amend previous commits
- Do NOT push after committing
