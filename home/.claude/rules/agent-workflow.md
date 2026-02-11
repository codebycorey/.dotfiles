# Agent Workflow

## Core Principles

- Simplicity over cleverness — the simplest working solution wins
- Never be lazy — implement fully, no placeholders, no TODOs left behind
- Verify before marking done — run tests, check the output, confirm it works
- Re-plan when stuck — if an approach isn't working after 2 attempts, step back and reconsider

## Subagent Patterns

- Keep teams small — max 2 teammates for most tasks
- One task per subagent — clear scope, clear deliverable
- Use the Task tool for independent research that won't pollute main context
- Clean up teams when done — shutdown teammates, delete team resources

## Model Selection

- **Opus** — planning, architecture decisions, complex multi-step reasoning
- **Sonnet** — code execution, implementation, straightforward edits
- **Haiku** — quick research, file searches, simple lookups

## Self-Learning Protocol

When you discover something non-obvious about the project (a gotcha, a pattern, an undocumented behavior), capture it in `LEARNINGS.md` at the project root.

Format:
```markdown
## [Category]

- **[Discovery]** — [What you learned and why it matters]
```

Categories: Architecture, Gotchas, Performance, Testing, Deployment, Dependencies

Rules:
- Ask before writing to LEARNINGS.md — the user may disagree with the observation
- Only capture things that would save future time — not obvious facts
- Keep entries concise — one line per learning when possible
- Update existing entries rather than duplicating

## Compact Instructions

When writing CLAUDE.md for projects, keep it tight:
- Commands section: only commands that actually work
- Architecture section: major directories and patterns, not every file
- Conventions section: only project-specific conventions, not universal ones
- Don't duplicate global rules (coding-style, git-workflow, shell-scripts) — they apply automatically
