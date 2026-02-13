# Worktree

Manage git worktrees for parallel development. Worktrees are created as sibling directories so tmux-sessionizer picks them up automatically.

**Arguments:** `<init <branch> | list | deliver | cleanup>`

## Subcommands

### `init <branch>`

Create a new worktree for parallel work on a separate branch.

1. Determine the worktree path: `../<repo-name>-wt-<branch>`
2. Create the worktree: `git worktree add <path> -b <branch>` (or without `-b` if the branch already exists)
3. Copy relevant untracked config files (`.env`, `.env.local`) if they exist
4. Run dependency install if a lockfile is present:
   - `package-lock.json` — `npm install`
   - `pnpm-lock.yaml` — `pnpm install`
   - `yarn.lock` — `yarn install`
   - `Cargo.lock` — `cargo build`
   - `go.sum` — `go mod download`
5. Run a quick test to verify the worktree is healthy (if test command is available)
6. Print a summary:
   ```
   Worktree created: ../<repo>-wt-<branch>
   Branch: <branch>
   Use Ctrl-f (tmux-sessionizer) to switch to it.
   ```

### `list`

Show all active worktrees with useful context.

1. Run `git worktree list --porcelain` and parse the output
2. For each worktree, show:
   - Path
   - Branch
   - Status (clean / dirty / uncommitted changes)
   - Age (time since last commit on that branch)

### `deliver`

Ship the work from the current worktree: test, commit, push, and create a PR.

1. Verify we're in a worktree (not the main working tree)
2. Run the project's test suite — refuse to continue if tests fail
3. Ensure all changes are committed
4. Push the branch: `git push -u origin <branch>`
5. Create a PR using `gh pr create` with:
   - Title from the branch name (cleaned up)
   - Body summarizing the commits
6. Ask the user if they want to remove the worktree after the PR is created

### `cleanup`

Remove worktrees that are no longer needed.

1. List all worktrees
2. Check which branches have been merged or have closed/merged PRs
3. Show candidates for removal with their status
4. Ask for confirmation before removing each one
5. Run `git worktree remove <path>` for confirmed removals
6. Run `git worktree prune` to clean up stale entries

## Guidelines

- Always place worktrees as siblings of the project directory (not inside it)
- Never remove the main worktree
- Worktree directory naming convention: `<repo-name>-wt-<branch>` (hyphens, no slashes in the directory name)
- Copy `.env*` files but never commit them
- If `init` fails (e.g. branch already exists as a worktree), suggest alternatives
- `deliver` should refuse to run if tests fail
