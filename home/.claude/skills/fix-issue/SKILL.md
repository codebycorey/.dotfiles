# Fix Issue

Fix a GitHub issue end-to-end: investigate, implement, test, and create a pull request.

**Arguments:** `<issue-number>`

## Steps

1. **Fetch the issue** using `gh issue view <number>` to get the full description, labels, and comments.

2. **Investigate the codebase** to understand:
   - Which files are affected
   - The root cause of the issue
   - What tests currently exist for the affected code

3. **Implement the fix**:
   - Create a feature branch: `fix/<issue-number>-<short-description>`
   - Make the minimal changes needed to resolve the issue
   - Follow existing project patterns and conventions

4. **Write or update tests** that cover the fix and prevent regression.

5. **Verify the fix**:
   - Run the project's test suite
   - Run linting and type checking if available
   - Confirm the original issue scenario is resolved

6. **Commit and push**:
   - Use conventional commit: `fix(scope): description (closes #<number>)`
   - Push the branch

7. **Create a pull request** using `gh pr create`:
   - Reference the issue in the PR body
   - Include a summary of what was changed and why
   - Add a test plan

## Guidelines

- Always read the full issue (including comments) before starting
- Prefer the smallest fix that fully resolves the issue
- If the issue is unclear or underspecified, ask the user for clarification before implementing
- If tests cannot be written (no test framework, untestable code), note this in the PR
- Do not close the issue manually — the PR's `closes #N` handles it
