# Review Blueprint

Multi-perspective code review for large or critical changes.

## Roles

| Role | Agent | Model | Purpose |
|------|-------|-------|---------|
| Lead | (you) | — | Orchestration, synthesis, final verdict |
| Security Reviewer | `reviewer` | sonnet | Security-focused analysis |
| Quality Reviewer | `reviewer` | sonnet | Correctness, edge cases, error handling |
| Perf Reviewer | `reviewer` | sonnet | Performance and scalability analysis |

## Task Flow

```
1. Prepare Review (Lead) — gather diff, context, and requirements
   ├── 2a. Security Review (Security Reviewer) — blocked by 1
   ├── 2b. Quality Review (Quality Reviewer) — blocked by 1
   └── 2c. Performance Review (Perf Reviewer) — blocked by 1
3. Synthesize (Lead) — blocked by 2a, 2b, 2c
4. Report (Lead) — blocked by 3
```

### Step Details

1. **Prepare**: Lead gathers the diff, identifies the change scope, and provides context to each reviewer with their specific focus area.
2. **Review**: All three reviewers work in parallel, each focusing on their dimension:
   - **Security**: Auth, injection, data exposure, secrets, OWASP top 10
   - **Quality**: Logic errors, edge cases, error handling, test coverage, maintainability
   - **Performance**: Query efficiency, memory usage, algorithmic complexity, caching opportunities
3. **Synthesize**: Lead deduplicates findings, resolves conflicts, and prioritizes.
4. **Report**: Lead presents a unified review with findings grouped by severity.

## When to Scale Down

- **Small change (< 100 lines)**: Skip the team. Use the `/review` command or a single reviewer.
- **Medium change (100-500 lines)**: Lead + 1 reviewer (quality focus).
- **Large or security-sensitive change**: Lead + Security + Quality reviewers.
- **Critical infrastructure change**: Full blueprint with all three perspectives.

## Coordination Rules

- Each reviewer focuses on their assigned dimension — avoid overlap
- Provide each reviewer with clear context about what they're reviewing and why
- Reviewers should include file paths and line numbers for every finding
- Lead resolves conflicting recommendations (e.g., security vs. performance tradeoff)
- Final report uses severity levels: critical, warning, suggestion
