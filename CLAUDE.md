# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS dotfiles repository using [GNU Stow](https://www.gnu.org/software/stow/) for symlink management. Dotfiles in `home/` are symlinked to `$HOME` via stow, preserving directory structure.

## Key Commands

```bash
# Apply all dotfiles (main + local overlays)
./setup.sh

# Apply only main dotfiles
./dotfiles.sh

# Apply a specific overlay
./dotfiles.sh local/personal
./dotfiles.sh local/alt

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

`dotfiles.sh` is the core script. It runs `stow -R` from a subfolder's `home/` directory targeting `$HOME`. The repo has three stow layers that overlay in order:

1. **`home/`** — Main dotfiles (always applied)
2. **`local/personal/home/`** — Personal overrides (cloned from `.dotfiles-personal`)
3. **`local/alt/home/`** — Alt overrides (cloned from `.dotfiles-alt`)

`setup.sh` orchestrates all three layers plus macOS-specific system preferences (`macos/macos.sh`).

### Local Overlays (`local/`)

Private dotfile overlays are cloned into `local/` by `setup.sh` (gitignored). This replaces the previous git submodule approach:
- `local/personal/` — cloned from `.dotfiles-personal`
- `local/alt/` — cloned from `.dotfiles-alt`

Each overlay has a `home/` directory that stow applies on top of the main dotfiles.

### Neovim Config

Neovim config ([vinevim](https://github.com/codebycorey/vinevim)) is cloned directly to `~/.config/nvim` by `setup.sh`. It is a separate repo — **do not modify files in that directory**.

### Shell Configuration

ZSH is the shell. `.zshenv` sets PATH and default programs (EDITOR=nvim). `.zshrc` sources shell configs in explicit order, then configures starship prompt, fnm, and zsh plugins.

Shell config files in `home/.config/shell/`:
- `env` — extra environment variables (sourced first)
- `aliases` — shell aliases
- `functions` — utility functions (extract, wireguard, etc.)

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
- Private/machine-specific configs go in `local/personal/` or `local/alt/`, not in `home/`
