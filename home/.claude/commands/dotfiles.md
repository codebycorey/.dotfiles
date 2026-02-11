---
description: Help with dotfiles repo tasks
allowed-tools: Bash, Read, Edit, Write, Grep, Glob
argument-hint: what you want to do (add config, debug stow, etc.)
---

Help with dotfiles repository tasks. This repo uses GNU Stow for symlink management.

Task: $ARGUMENTS

Key context:
- Dotfiles live in `home/` and are symlinked to `$HOME` via `stow -R`
- Neovim config is a separate repo cloned directly to `~/.config/nvim` (do NOT modify)
- Shell aliases and functions live in `home/.config/shell/aliases`
- Apply changes: `./dotfiles.sh` (main) or `./setup.sh` (all layers)
- Preview changes: `./dotfiles.sh --dry-run`
- Clean symlinks: `./dotfiles.sh --clean`

Common tasks:
- **Add a new config**: Create the file in `home/` mirroring the home directory structure, then run `./dotfiles.sh`
- **Debug stow conflicts**: Run `./dotfiles.sh --dry-run` and check for existing files that aren't symlinks
- **Add a brew package**: `brew install <pkg>` then `brewdump` to update the Brewfile
- **Add a git identity**: Create `~/.gitconfig.local` with `[user]` name/email (included by stowed `.gitconfig`)
