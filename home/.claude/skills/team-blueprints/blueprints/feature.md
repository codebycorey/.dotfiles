# Feature Blueprint

Build a new feature with planning, implementation, testing, and review.

## Roles

| Role | Agent | Model | Purpose |
|------|-------|-------|---------|
| Lead | (you) | — | Orchestration, planning, task management |
| Implementer | `implementer` | sonnet | Code implementation following project patterns |
| Test Writer | `test-writer` | sonnet | Test generation after implementation |
| Reviewer | `reviewer` | sonnet | Code review before completion |

## Task Flow

```
1. Plan (Lead)
   ├── 2. Implement (Implementer) — blocked by 1
   ├── 3. Write Tests (Test Writer) — blocked by 2
   └── 4. Review (Reviewer) — blocked by 2
5. Address Feedback (Lead/Implementer) — blocked by 3, 4
```

### Step Details

1. **Plan**: Break the feature into implementation tasks. Identify files to modify, patterns to follow, and acceptance criteria. Share the plan with the team.
2. **Implement**: Implementer builds the feature following the plan. Reports back when done.
3. **Write Tests**: Test writer reads the implementation and writes tests. Runs concurrently with review.
4. **Review**: Reviewer analyzes the implementation for bugs, security, and performance.
5. **Address Feedback**: Fix any issues found by tests or review.

## When to Scale Down

- **Single-file feature**: Skip the team. Implement, test, and self-review.
- **Small feature (2-3 files)**: Lead + Implementer only. Write tests yourself after.
- **Medium feature (4-10 files)**: Lead + Implementer + Reviewer. Write tests yourself or add test writer.
- **Large feature (10+ files)**: Full blueprint with all roles.

## Coordination Rules

- Implementer should commit or checkpoint before review starts
- Test writer and reviewer can work in parallel after implementation
- Reviewer should not suggest style changes — only bugs, security, and performance
- If review finds critical issues, implementer addresses them before tests are finalized
