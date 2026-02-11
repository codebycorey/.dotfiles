# Handoff

Generate a structured handoff document for session continuity. Captures the current state of work so a future session can resume effectively.

## When to use

Use this skill when the user asks to "create a handoff", "save session state", "prepare for handoff", or when ending a long session with work in progress.

## Steps

1. **Gather state** (in parallel):
   - `git status` — staged, unstaged, untracked files
   - `git log --oneline -5` — recent commits
   - `git branch --show-current` — current branch
   - `git diff --stat` — working tree changes
   - Read `CLAUDE.md` for project context

2. **Ask the user** to confirm:
   - What was the goal of this session?
   - What's done and what's still in progress?
   - Any blockers or decisions pending?

3. **Generate `.handoff.md`** at the project root with:

```markdown
# Session Handoff
**Date**: [YYYY-MM-DD]
**Branch**: [branch-name]

## Goal
[What this session was trying to accomplish]

## Completed
- [What was finished, with file references]

## In Progress
- [What's partially done, with current state]

## Approach
[Brief description of the approach being taken and why]

## Blockers
- [Anything blocking progress, decisions needed]

## Key Files
- [Files central to the current work, with brief notes]

## Resume Instructions
1. [Specific steps to pick up where this left off]
```

4. **Confirm** the handoff was written and remind the user to reference it in their next session with `/kickoff` or by asking Claude to read `.handoff.md`.

## Guidelines

- Keep the handoff under 40 lines — it's a summary, not a transcript
- Include file paths for everything mentioned
- Resume instructions should be specific enough that a fresh session can act on them
- Do not include conversation history or debug logs — just state and intent
- If there are no blockers, omit that section
- Do not overwrite an existing `.handoff.md` without asking
