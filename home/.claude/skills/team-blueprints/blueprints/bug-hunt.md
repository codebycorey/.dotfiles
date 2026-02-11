# Bug Hunt Blueprint

Debug a problem via parallel hypothesis investigation.

## Roles

| Role | Agent | Model | Purpose |
|------|-------|-------|---------|
| Lead | (you) | — | Orchestration, hypothesis generation, final fix |
| Investigator A | `researcher` | haiku | Explore hypothesis 1 |
| Investigator B | `researcher` | haiku | Explore hypothesis 2 |
| Fixer | `implementer` | sonnet | Implement the fix once root cause is found |

## Task Flow

```
1. Reproduce & Hypothesize (Lead)
   ├── 2a. Investigate Hypothesis A (Investigator A) — blocked by 1
   └── 2b. Investigate Hypothesis B (Investigator B) — blocked by 1
3. Synthesize Findings (Lead) — blocked by 2a, 2b
4. Implement Fix (Fixer) — blocked by 3
5. Verify Fix (Lead) — blocked by 4
```

### Step Details

1. **Reproduce & Hypothesize**: Reproduce the bug, generate 2-3 hypotheses about root cause. Assign one hypothesis per investigator.
2. **Investigate**: Each investigator traces their hypothesis through the codebase. They report: confirmed/denied, evidence, and any new leads.
3. **Synthesize**: Lead reviews findings, identifies root cause, and creates a fix plan.
4. **Fix**: Implementer applies the fix following the plan.
5. **Verify**: Lead confirms the fix resolves the bug and doesn't introduce regressions.

## When to Scale Down

- **Obvious bug (clear stack trace)**: Skip the team. Fix it directly.
- **Single hypothesis**: Lead + 1 Investigator. Fix it yourself after.
- **Complex bug (multiple possible causes)**: Full blueprint with parallel investigation.

## Coordination Rules

- Each investigator owns one hypothesis — no overlap
- Investigators report findings even if their hypothesis is disproven (negative results are valuable)
- Fixer should not start until root cause is confirmed
- Lead verifies the fix by running the reproduction steps
