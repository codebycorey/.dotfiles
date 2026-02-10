# Project Init

Initialize Claude Code configuration for any project by detecting the tech stack and generating appropriate CLAUDE.md, commands, and settings.

## When to use

Use this skill when setting up Claude Code in a new project for the first time, or when the user asks to "init claude", "set up claude code", or "bootstrap claude config".

## Steps

1. **Detect the tech stack** by examining:
   - `package.json` (Node.js/TypeScript/React/Next.js)
   - `go.mod` (Go)
   - `Cargo.toml` (Rust)
   - `pyproject.toml` / `requirements.txt` (Python)
   - `Gemfile` (Ruby)
   - `Makefile`, `docker-compose.yml`, `.editorconfig`
   - Existing CI config (`.github/workflows/`, `.gitlab-ci.yml`)
   - Existing linters/formatters (`.eslintrc`, `.prettierrc`, `rustfmt.toml`, etc.)

2. **Generate `CLAUDE.md`** at project root with:
   - Overview section describing the project
   - Key commands (build, test, lint, format, run)
   - Architecture overview (major directories, patterns)
   - Conventions (formatting, naming, testing approach)

3. **Generate custom commands** in `.claude/commands/` based on stack:
   - Always: `commit.md`, `review.md`
   - If tests exist: `test.md` (run tests intelligently)
   - If CI exists: `ci-check.md` (run CI checks locally)

4. **Ask the user** to review the generated files and adjust as needed.

## Guidelines

- Keep CLAUDE.md concise — focus on what an AI assistant needs to know
- Only include commands that actually work (verify executables exist)
- Match the project's existing style and conventions
- Do not overwrite existing CLAUDE.md or commands without asking
