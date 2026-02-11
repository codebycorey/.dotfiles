# Agent Workflow

## Core Principles

- Simplicity over cleverness — the simplest working solution wins
- Never be lazy — implement fully, no placeholders, no TODOs left behind
- Verify before marking done — run tests, check the output, confirm it works
- Re-plan when stuck — if an approach isn't working after 2 attempts, step back and reconsider

## Specialist Agents

Six global agents are available in `~/.claude/agents/`. Use the right agent for the job:

| Agent | Model | When to Use |
|-------|-------|-------------|
| `researcher` | haiku | Codebase exploration, web research, context gathering |
| `implementer` | sonnet | Code implementation following project patterns |
| `reviewer` | sonnet | Code review for bugs, security, performance |
| `test-writer` | sonnet | Test generation from implementation code |
| `docs-writer` | sonnet | Documentation generation and maintenance |
| `architect` | opus | System design, architecture evaluation, planning |

**Selection rules:**
- Research and exploration → `researcher` (fast, read-only)
- Writing code → `implementer` (full write access, pattern-aware)
- Reviewing code → `reviewer` (read-only, multi-dimensional analysis)
- Writing tests → `test-writer` (matches project test patterns)
- Writing docs → `docs-writer` (no Bash access, focused on clarity)
- Architecture decisions → `architect` (opus-level reasoning, read-only)

## Team Patterns

Team blueprints are available in `~/.claude/skills/team-blueprints/blueprints/`:

- **Feature** — implementation + testing + review pipeline
- **Bug Hunt** — parallel hypothesis investigation
- **Refactor** — safe restructuring with behavior verification
- **Review** — multi-perspective analysis for critical changes

**Team size rules:**
- Max 3 teammates for most tasks, 4 only for genuinely independent work streams
- Skip the team for changes under ~50 lines or single-file edits
- Start small and add agents if needed — don't over-parallelize
- One task per subagent — clear scope, clear deliverable
- Clean up teams when done — shutdown teammates, delete team resources

## Context Management

- **Starting a session**: Use `/kickoff` to load focused context and create a plan
- **Ending a session**: Use the handoff skill to capture state for continuity
- **After completing work**: Use `/retro` to extract and record learnings
- **Capturing insights**: Use `/blog-notes` to save blog-worthy observations

The knowledge loop: `/retro` captures learnings → `/kickoff` loads them → each session starts smarter.

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
