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

Shell aliases and functions live in a single file: `home/.config/shell/aliases`.

### Custom Scripts (`home/.local/bin/`)

- `tmux-manager` — fzf-based tmux session picker (bound to `Ctrl-f` in zsh and `prefix f` in tmux). Edit `INCLUDE_PATHS` and `EXTRA_PATHS` arrays to change which directories are listed.
- `brewdump` — dumps current Homebrew state to `macos/Brewfile`
- `delete-branches.sh` — fzf-based git branch cleanup

### Claude Code Config (`home/.claude/`)

Stowed to `~/.claude/`, merging alongside Claude Code's own files (`settings.json`, `projects/`, etc.):

- **`commands/`** — Custom slash commands: `/commit`, `/pr`, `/review`, `/tidy`, `/dotfiles`
- **`skills/`** — Skills: `project-init` (initialize Claude Code config for any project)
- **`rules/`** — Rules: `coding-style`, `git-workflow`, `shell-scripts`
- **`hooks/`** — Hook scripts: `notify-macos.sh` (notifications), `format-on-edit.sh` (auto-format). Note: hook *configuration* in `settings.json` must be set up separately since that file is managed by Claude Code at runtime.

### Tool Configs

- **tmux** (`home/.tmux.conf`) — prefix is `C-Space`, uses TPM plugins, catppuccin theme, vim-tmux-navigator. `prefix + c` opens Claude Code in a popup.
- **wezterm** (`home/.config/wezterm/`) — Lua config with separate colorschemes module
- **starship** (`home/.config/starship.toml`) — prompt theme
- **aerospace** (`home/.config/aerospace/`) — tiling window manager

### macOS Setup

`macos/macos.sh` configures system preferences (Finder, Dock, keyboard repeat rate) and sets up 1Password SSH agent. `macos/Brewfile` is the declarative package list — update it with `brewdump` after installing/removing packages.

## Conventions

- Indent with 4 spaces (see `.editorconfig`)
- Shell scripts use `#!/usr/bin/env bash` (or `zsh` for shell configs)
- Configs targeting `$HOME` go in `home/` mirroring the home directory structure
