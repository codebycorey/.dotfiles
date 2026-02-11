# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS dotfiles repository using [GNU Stow](https://www.gnu.org/software/stow/) for symlink management. Dotfiles in `home/` are symlinked to `$HOME` via stow, preserving directory structure.

## Key Commands

```bash
# Apply dotfiles
./setup.sh

# Apply only stow symlinks
./dotfiles.sh

# Remove symlinks
./dotfiles.sh --clean

# Dry run (preview changes)
./dotfiles.sh --dry-run

# Full machine bootstrap (Xcode, Homebrew, packages, Rust, dotfiles)
./bootstrap.sh

# Dump current Homebrew state to macos/Brewfile
brewdump
```

## Architecture

### Stow Symlink System

`dotfiles.sh` is the core script. It runs `stow -R --adopt` from `home/` targeting `$HOME`, then restores repo versions via `git checkout`. `setup.sh` orchestrates directory creation, nvim clone, macOS preferences, and dotfiles application.

### Neovim Config

Neovim config ([vinevim](https://github.com/codebycorey/vinevim)) is cloned directly to `~/.config/nvim` by `setup.sh`. It is a separate repo — **do not modify files in that directory**.

### Shell Configuration

ZSH is the shell. Two main config files:

- **`.zshenv`** — PATH (`~/.local/bin`, `~/.cargo/bin`, `/opt/homebrew/bin`) and default programs (EDITOR=nvim)
- **`.zshrc`** — sources `~/.config/shell/aliases`, sets zsh options, history, completions, starship prompt, fnm, and zsh plugins

Shell aliases and functions live in a single file: `home/.config/shell/aliases`. Key functions:

- **`np <name>`** — create new project in `~/projects/personal/`, init git, print next steps. Use the sessionizer hotkey (`Ctrl-f` / `prefix f`) to switch to it.

### Custom Scripts (`home/.local/bin/`)

- `tmux-sessionizer` — enhanced fzf-based tmux session picker with rich previews, session management, and per-project layout support (bound to `Ctrl-f` in zsh and `prefix f` in tmux). Edit `INCLUDE_PATHS` and `EXTRA_PATHS` arrays to change listed directories. Supports `.tmux-layout.sh` files for automated workspace setup.
- `tmux-sessionizer-preview` — preview script for tmux-sessionizer showing git info, project type, and session status
- `tmux-layout-helpers` — shared layout functions (`window`, `pane`, `run_command`) sourced by tmux-sessionizer and the `p` shell function. Not a standalone script.
- `tmux-command-palette` — fzf popup menu of common tmux actions (bound to `prefix P`)
- `tmux-capture-context` — captures pane output and pipes to Claude Code for analysis (bound to `prefix C`)
- `archive-project` — moves a project from `~/projects/personal/` to `~/archives/`, kills active tmux session
- `unarchive-project` — restores a project from `~/archives/` to `~/projects/personal/`
- `claude-cleanup` — kills orphaned Claude Code processes (no controlling TTY). Use `--dry-run` to preview, `--all` to kill everything.
- `notify-run` — wrapper that runs a command and sends macOS notification on completion with duration and exit status (aliased as `nrun`)
- `brewdump` — dumps current Homebrew state to `macos/Brewfile`
- `delete-branches.sh` — fzf-based git branch cleanup

### Claude Code Config (`home/.claude/`)

Stowed to `~/.claude/`, merging alongside Claude Code's own files (`settings.json`, `projects/`, etc.):

- **`commands/`** — Custom slash commands: `/commit`, `/pr`, `/review`, `/tidy`, `/dotfiles`
- **`skills/`** — Skills: `project-init` (initialize Claude Code config for any project), `tmux-layout` (generate per-project `.tmux-layout.sh` files)
- **`rules/`** — Rules: `coding-style`, `git-workflow`, `shell-scripts`, `agent-workflow`
- **`hooks/`** — Hook scripts: `notify-macos.sh` (notifications), `format-on-edit.sh` (auto-format). Note: hook *configuration* in `settings.json` must be set up separately since that file is managed by Claude Code at runtime.

### Tool Configs

- **tmux** (`home/.tmux.conf`) — prefix is `C-Space`, uses TPM plugins (catppuccin, vim-tmux-navigator, resurrect, extrakto, thumbs), gitmux status bar integration. Key bindings: `prefix f` sessionizer, `prefix P` command palette, `prefix C` context capture, `prefix T` thumbs, `prefix Tab` extrakto, `prefix Space` last window toggle, `prefix S` sync panes, `prefix </>` reorder windows.
- **gitmux** (`home/.gitmux.conf`) — git status in tmux status bar with catppuccin mocha colors
- **wezterm** (`home/.config/wezterm/`) — Lua config with separate colorschemes module
- **starship** (`home/.config/starship.toml`) — prompt theme
- **aerospace** (`home/.config/aerospace/`) — tiling window manager

### macOS Setup

`macos/macos.sh` configures system preferences (Finder, Dock, keyboard repeat rate) and sets up 1Password SSH agent. `macos/Brewfile` is the declarative package list — update it with `brewdump` after installing/removing packages.

## Conventions

- Indent with 4 spaces (see `.editorconfig`)
- Shell scripts use `#!/usr/bin/env bash` (or `zsh` for shell configs)
- Configs targeting `$HOME` go in `home/` mirroring the home directory structure
