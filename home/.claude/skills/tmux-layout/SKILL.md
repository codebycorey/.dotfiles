# tmux-layout

Generate a `.tmux-layout.sh` file for the current project that automates tmux workspace setup with project-specific windows and panes.

## When to use

Use this skill when the user asks to "generate a tmux layout", "create tmux layout", "set up tmux workspace", or wants to automate their tmux session for a project.

## Steps

1. **Detect the project type** by examining:
   - `package.json` — scripts (dev, start, test, build, lint)
   - `Cargo.toml` — binary/library crate, workspace members
   - `go.mod` — module name
   - `pyproject.toml` / `requirements.txt` — Python project
   - `Makefile` — available targets
   - `docker-compose.yml` — services
   - `turbo.json` / `pnpm-workspace.yaml` — monorepo detection

2. **Generate `.tmux-layout.sh`** at the project root:
   - Window 1 is always `nvim`
   - Window 2 is always `claude`
   - Windows 3+ are project-specific based on detected scripts/commands
   - Last window is always a bare `shell` for ad-hoc work
   - Keep layouts to 4-6 windows total — don't over-create
   - Use `pane` only for monorepos or truly related side-by-side processes
   - Leave windows bare (no command) when unsure what to run

3. **Use actual project commands** found in config files:
   - npm/pnpm scripts → `npm run dev`, `npm test`
   - Cargo commands → `cargo run`, `cargo test`
   - Make targets → `make dev`, `make test`
   - Docker compose → `docker compose up`

4. **Make the file executable** with `chmod +x .tmux-layout.sh`

## Output format

The generated file uses helper functions provided by tmux-sessionizer:

```bash
#!/usr/bin/env bash
# tmux-layout: project-name (Tech Stack)

window "nvim" "nvim"
window "claude" "claude"
window "dev" "npm run dev"
window "test"
window "shell"
```

## Guidelines

- Always start with `#!/usr/bin/env bash` and a comment identifying the project
- Window 1: always nvim, Window 2: always claude — these are non-negotiable
- Use actual commands from the project, not guesses
- Prefer fewer windows over many — 4-6 is ideal
- Use `pane "vertical" "command"` sparingly, only for truly parallel processes
- The `shell` window should be last and have no command
- Do not overwrite an existing `.tmux-layout.sh` without asking
