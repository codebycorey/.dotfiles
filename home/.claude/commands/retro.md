---
description: Run a post-feature retrospective and capture learnings
allowed-tools: Bash, Read, Grep, Glob
argument-hint: branch name (defaults to current branch)
---

Analyze the work done on the current branch and extract learnings for future sessions.

Steps:
1. Determine the branch from $ARGUMENTS or `git branch --show-current`.
2. Gather the work history:
   - `git log --oneline main..HEAD` for commit history
   - `git diff --stat main..HEAD` for files changed
   - `git diff main..HEAD` for the actual changes (scan, don't read every line)
3. Analyze the work and identify:
   - **What worked well** — patterns that were effective, good decisions
   - **What was harder than expected** — surprises, yak shaves, wrong assumptions
   - **Gotchas discovered** — non-obvious behaviors, undocumented quirks
   - **Patterns established** — new conventions or approaches worth reusing
4. **Documentation gap check** — review the changed files and flag:
   - Feature code modified without a corresponding `docs/specs/` update in the same branch
   - New library, framework, or architectural pattern introduced without an ADR in `docs/decisions/`
   - Privacy-impacting changes (new data fields, third-party services, HealthKit) without `docs/security.md` update
   - Present any gaps as a **Documentation Gaps** section in the output
5. Categorize findings using LEARNINGS.md categories:
   - Architecture, Gotchas, Performance, Testing, Deployment, Dependencies, Process
6. Present findings to the user in this format:
   - **Summary**: 2-3 sentences on what was accomplished
   - **Documentation Gaps**: Any missing spec/ADR/security updates (or "None" if all docs are current)
   - **Learnings**: Bulleted list with category tags, one line each
   - **Suggested LEARNINGS.md entries**: Formatted entries ready to append
7. Ask the user which learnings to keep, modify, or discard.
8. If approved, append entries to `LEARNINGS.md` (create the file if it doesn't exist).

Rules:
- Only suggest non-obvious learnings — skip things any developer would know
- Keep each learning to one line when possible
- Don't duplicate entries already in LEARNINGS.md
- If the branch has no meaningful learnings, say so — don't force it
- Do NOT modify any code — this command only analyzes and writes to LEARNINGS.md
