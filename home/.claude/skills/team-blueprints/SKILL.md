# Team Blueprints

Provide reusable team patterns for common development workflows. Blueprints define roles, task flow, and coordination rules that Claude adapts to the specific task.

## When to use

Use this skill when the user asks to "use a team", "create a team for this feature", "parallelize this work", or when you identify a task that would benefit from multiple agents working together. Also use when the user references a specific blueprint by name (feature, bug-hunt, refactor, review).

## How it works

1. Read the appropriate blueprint from `~/.claude/skills/team-blueprints/blueprints/`
2. Assess the task complexity to determine actual team size (blueprints scale down)
3. Create the team using TeamCreate
4. Create tasks using TaskCreate with appropriate dependencies
5. Spawn teammates using the Task tool with the agent types specified in the blueprint
6. Coordinate the workflow as described in the blueprint

## Available Blueprints

| Blueprint | File | When to Use |
|-----------|------|-------------|
| Feature | `blueprints/feature.md` | Building new features with implementation, tests, and review |
| Bug Hunt | `blueprints/bug-hunt.md` | Debugging via parallel hypothesis investigation |
| Refactor | `blueprints/refactor.md` | Safe refactoring with continuous behavior verification |
| Review | `blueprints/review.md` | Multi-perspective code review for large or critical changes |

## Scaling Rules

Blueprints are suggestions, not rigid templates. Always scale to the task:

- **Skip the team entirely** for changes under ~50 lines or single-file edits
- **Use 2 agents** for most tasks (lead + one specialist)
- **Use 3 agents** when there are genuinely independent work streams
- **Use 4 agents** only for large features with clear parallel tracks (rare)
- When in doubt, start small — you can always add agents later

## Guidelines

- Read the full blueprint before creating the team
- Adapt roles to the specific task — not every blueprint role is always needed
- Use the specialist agents from `~/.claude/agents/` for team roles
- Clean up teams when done — shutdown all teammates and delete team resources
