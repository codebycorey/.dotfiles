# Changelog

Generate user-facing release notes from git history, grouped by change type.

**Arguments:** `<version tag or date range>` (e.g. `v1.2.0`, `v1.1.0..v1.2.0`, `2024-01-01..today`, or omit for latest tag to HEAD)

## Steps

1. **Parse the argument** to determine the range:
   - Version tag (e.g. `v1.2.0`) — diff from that tag to HEAD
   - Two tags (e.g. `v1.1.0..v1.2.0`) — diff between tags
   - Date range (e.g. `2024-01-01..today`) — commits in that period using `--since` / `--until`
   - No argument — diff from the latest tag to HEAD (`git describe --tags --abbrev=0`)

2. **Gather commits** using `git log --oneline --no-merges` for the determined range.

3. **Group commits by type** using conventional commit prefixes:
   - **New Features** — `feat:` commits
   - **Bug Fixes** — `fix:` commits
   - **Improvements** — `refactor:`, `perf:`, `style:` commits
   - **Breaking Changes** — commits with `BREAKING CHANGE` in body or `!` after type

4. **Rewrite in user-facing language**:
   - Remove commit prefixes and scopes
   - Use past tense ("Added...", "Fixed...")
   - Focus on what changed for the user, not implementation details
   - Drop purely internal changes (CI, tests, docs) unless the user asks to include them

5. **Output formatted markdown**:

```markdown
# Changelog — [version or range]

## New Features
- [Description]

## Bug Fixes
- [Description]

## Improvements
- [Description]

## Breaking Changes
- [Description and migration steps]
```

6. **Ask the user** if they want to append the output to `CHANGELOG.md`.

## Guidelines

- If no conventional commits are used, group by best guess from commit messages
- Omit empty sections
- Keep descriptions to one line each
- For breaking changes, always include migration steps
- Do not fabricate changes — only include what's in the git history
