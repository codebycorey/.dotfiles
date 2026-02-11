# Refactor Blueprint

Safe refactoring with architecture guidance and continuous behavior verification.

## Roles

| Role | Agent | Model | Purpose |
|------|-------|-------|---------|
| Lead | (you) | — | Orchestration, task management |
| Architect | `architect` | opus | Design the target structure, evaluate tradeoffs |
| Implementer | `implementer` | sonnet | Execute the refactoring steps |
| Reviewer | `reviewer` | sonnet | Verify behavior preservation after each step |

## Task Flow

```
1. Analyze Current State (Architect)
2. Design Target Structure (Architect) — blocked by 1
3. Plan Migration Steps (Lead) — blocked by 2
   ├── 4. Execute Step N (Implementer) — blocked by 3
   └── 5. Verify Step N (Reviewer) — blocked by 4
   (repeat 4-5 for each migration step)
6. Final Verification (Lead) — blocked by all steps
```

### Step Details

1. **Analyze**: Architect maps the current code structure, dependencies, and behavior.
2. **Design**: Architect proposes the target structure with rationale and tradeoffs.
3. **Plan**: Lead breaks the refactor into small, safe steps. Each step should leave the codebase in a working state.
4. **Execute**: Implementer performs one refactoring step at a time.
5. **Verify**: Reviewer confirms behavior is preserved (tests pass, no regressions).
6. **Final**: Lead runs the full test suite and confirms the refactor meets the target design.

## When to Scale Down

- **Rename/move refactor**: Skip the team. Do it directly.
- **Small refactor (1-2 patterns)**: Lead + Implementer. Self-review.
- **Medium refactor (module restructure)**: Lead + Implementer + Reviewer.
- **Large refactor (cross-cutting change)**: Full blueprint with architect.

## Coordination Rules

- Every refactoring step must leave the codebase in a working state (tests pass)
- Implementer commits after each step — never batch multiple steps
- Reviewer verifies after each step, not just at the end
- If tests break, stop and fix before continuing to the next step
- Architect is consulted when the implementer encounters structural decisions not covered by the plan
