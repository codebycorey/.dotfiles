# tmux Cheatsheet

> Prefix key: `C-Space` (Ctrl+Space)

All keybindings below are prefixed with `C-Space` unless noted otherwise.

## Session Management

| Key       | Action                          |
|-----------|---------------------------------|
| `f`       | Open tmux-sessionizer (fuzzy)   |
| `C-s`     | Save session (Resurrect)        |
| `C-r`     | Restore session (Resurrect)     |
| `d`       | Detach from session             |
| `s`       | List sessions                   |
| `$`       | Rename session                  |

## Window Management

| Key       | Action                          |
|-----------|---------------------------------|
| `Space`   | Switch to last window           |
| `C-p`     | Previous window                 |
| `C-n`     | Next window                     |
| `<`       | Move window left                |
| `>`       | Move window right               |
| `c`       | Open Claude Code popup          |
| `1`-`9`   | Switch to window by number      |
| `,`       | Rename window                   |
| `&`       | Close window                    |

## Pane Management

| Key       | Action                          |
|-----------|---------------------------------|
| `v`       | Split vertical                  |
| `h`       | Split horizontal                |
| `arrows`  | Resize panes                    |
| `z`       | Toggle pane zoom                |
| `S`       | Sync panes (toggle)             |
| `x`       | Close pane                      |
| `q`       | Show pane numbers               |
| `{`       | Swap pane up                    |
| `}`       | Swap pane down                  |

## Navigation (vim-tmux-navigator)

Seamlessly navigate between tmux panes and neovim splits.

| Key       | Action                          |
|-----------|---------------------------------|
| `C-h`     | Move left                       |
| `C-j`     | Move down                       |
| `C-k`     | Move up                         |
| `C-l`     | Move right                      |

These work without the prefix key — press directly in any pane.

## Plugins

### Extrakto

| Key       | Action                          |
|-----------|---------------------------------|
| `Tab`     | Fuzzy search and copy text from pane output |

### Thumbs

| Key       | Action                          |
|-----------|---------------------------------|
| `T`       | Show letter hints to quick-copy visible text |

### Resurrect

| Key       | Action                          |
|-----------|---------------------------------|
| `C-s`     | Save current session layout     |
| `C-r`     | Restore saved session layout    |

## Tools

### Command Palette

| Key       | Action                          |
|-----------|---------------------------------|
| `P`       | Open command palette with common tmux actions |

### Context Capture

| Key       | Action                          |
|-----------|---------------------------------|
| `C`       | Capture pane output and send to Claude for analysis |

## Shell Keybindings

These work in the shell directly, without the tmux prefix.

| Key       | Action                          |
|-----------|---------------------------------|
| `Ctrl-f`  | Open tmux-sessionizer           |

## Aliases

| Alias     | Command                         |
|-----------|---------------------------------|
| `nrun`    | `notify-run` — run command with macOS notification on completion |

## Config

| Key       | Action                          |
|-----------|---------------------------------|
| `r`       | Reload tmux config              |

## Project Layouts

Projects can define a `.tmux-layout.sh` file at their root to automate workspace setup. When tmux-sessionizer opens a project with this file, it automatically creates windows and panes.

### Format

```bash
#!/usr/bin/env bash
# tmux-layout: project-name (Tech Stack)

window "nvim" "nvim"
window "claude" "claude"
window "dev" "npm run dev"
window "test"
window "shell"
```

### Functions

| Function                        | Description                                   |
|---------------------------------|-----------------------------------------------|
| `window "name" "command"`       | Create a new window, optionally run a command |
| `pane "vertical" "command"`     | Split the current window into a pane          |

### Generating layouts

Use the `/tmux-layout` Claude skill to auto-detect your project's tech stack and generate a layout file.
