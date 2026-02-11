---
description: Start a session with focused context loading and a concise plan
allowed-tools: Bash, Read, Grep, Glob
argument-hint: task description, issue number, or leave blank to be asked
---

Start a focused work session by loading only the context needed for the task.

Steps:
1. Determine the task from $ARGUMENTS. If empty, ask the user what they're working on.
2. If the argument looks like a GitHub issue number (e.g., #42 or 42), fetch it with `gh issue view $ARGUMENTS`.
3. Load baseline context (in parallel):
   - Read `CLAUDE.md` if it exists
   - Read `LEARNINGS.md` if it exists (surface relevant entries for this task)
   - Run `git status` and `git log --oneline -5` for recent activity
4. Identify the 3-5 most relevant files for this task using Grep and Glob. Be surgical — do NOT read every file in the project.
5. Present a concise session plan:
   - **Task**: One-line summary of what we're doing
   - **Context**: Key files identified (with brief relevance notes)
   - **Learnings**: Any relevant entries from LEARNINGS.md
   - **Approach**: 3-5 numbered steps to complete the task
   - **Questions**: Anything unclear that needs user input
6. Ask the user to confirm or adjust the plan before starting.

Rules:
- Keep the plan under 15 lines — this is a launchpad, not a design doc
- Only load files directly relevant to the task — avoid context bloat
- Surface LEARNINGS.md entries that relate to the current task
- If no LEARNINGS.md exists, skip that section silently
- Do NOT start implementing — this command only plans and loads context
