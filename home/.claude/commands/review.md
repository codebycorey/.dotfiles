---
description: Review code changes for bugs, security, and performance
allowed-tools: Bash, Read, Grep, Glob
argument-hint: PR number, branch name, or file path
---

Review code changes for bugs, security issues, and performance problems.

Determine the review target from $ARGUMENTS:
- If a PR number: `gh pr diff $ARGUMENTS`
- If a branch name: `git diff main...$ARGUMENTS`
- If a file path: `git diff HEAD -- $ARGUMENTS`
- If empty: `git diff` (unstaged changes) or `git diff --cached` (staged changes)

Review checklist:
1. **Bugs**: Logic errors, off-by-ones, null/undefined handling, race conditions
2. **Security**: Injection vulnerabilities, hardcoded secrets, insecure defaults, OWASP top 10
3. **Performance**: N+1 queries, unnecessary re-renders, missing indexes, unbounded loops
4. **Error handling**: Missing error cases, swallowed errors, unhelpful error messages
5. **Edge cases**: Empty inputs, boundary values, concurrent access

Output format:
- Group findings by severity: critical, warning, suggestion
- Include file path and line number for each finding
- Provide a brief explanation and suggested fix
- End with a summary: approve, request changes, or needs discussion
