# Vim

1. Install vim-plug

```bash
brew update
brew install --HEAD tree-sitter luajit neovim
```

## Plugins

- vim-plug
- nvim-lspconfig
- nvim-treesitter
- completion-nvim
- lspsaga.nvim
- telescope.nvim
- lualine.nvim

## Language Servers

```bash
# Lua
brew install lua-language-server

# Typescript
npm install -g typescript typescript-language-server

# Go
brew install golang
go install golang.org/x/tools/gopls@latest

# HTML, CSS, eslint, jsonls,
npm i -g vscode-langservers-extracted

# rust
brew install rust-analyzer
```
