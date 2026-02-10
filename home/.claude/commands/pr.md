---
description: Create a GitHub PR with structured description
allowed-tools: Bash, Read, Grep
argument-hint: optional PR title or context
---

Create a GitHub Pull Request for the current branch.

Steps:
1. Run `git log --oneline main..HEAD` to see all commits on this branch
2. Run `git diff main...HEAD --stat` for a change summary
3. Run `git diff main...HEAD` to understand the full scope of changes
4. Check if the branch is pushed: `git status -sb`
5. If not pushed, push with `git push -u origin HEAD`
6. Create the PR using `gh pr create` with:
   - A concise title (under 70 chars)
   - A structured body with ## Summary and ## Test plan sections

If the user provided context, incorporate it: $ARGUMENTS

Format the PR body like:
```
## Summary
- Bullet points describing key changes

## Test plan
- [ ] How to verify the changes work
```

Rules:
- Keep the title short and descriptive
- Summary bullets should explain WHY, not just list files
- Always include a test plan
- Do NOT merge the PR
