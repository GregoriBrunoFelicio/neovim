# Neovim Config

Personal Neovim configuration for C# development on Linux.

## Plugins

### UI
- **vscode.nvim** - VS Code dark theme
- **lualine.nvim** - Status line at the bottom
- **nvim-tree** - File explorer sidebar
- **nvim-web-devicons** - File icons

### Editor
- **nvim-treesitter** - Syntax highlighting
- **nvim-autopairs** - Auto closes brackets and quotes
- **which-key.nvim** - Shows available keybindings as you type

### LSP & Completion
- **mason.nvim** - LSP server installer and manager
- **mason-lspconfig.nvim** - Mason integration with nvim-lspconfig
- **mason-tool-installer.nvim** - Auto install LSP tools via Mason
- **nvim-lspconfig** - LSP configuration
- **roslyn.nvim** - C# language server (Roslyn)
- **fidget.nvim** - LSP progress indicator

### Formatting
- **conform.nvim** - Code formatter (csharpier for C#, clang-format for C/C++, stylua for Lua)

### Debugging
- **nvim-dap** - Debugger (DAP)
- **nvim-dap-ui** - UI for nvim-dap
- **nvim-dap-cs** - C# debug adapter integration
- **nvim-dap-virtual-text** - Shows debug values inline
- **nvim-nio** - Async library (nvim-dap-ui dependency)

### Search
- **telescope.nvim** - Fuzzy finder for files and text search
- **telescope-fzf-native.nvim** - FZF sorter for telescope (faster search)
- **plenary.nvim** - Lua utility library (telescope dependency)

### Git
- **gitsigns.nvim** - Git changes indicators in the gutter

## Key mappings

Leader key is `Space`.

| Key | Action |
|-----|--------|
| `Space e` | Toggle file explorer |
| `Space o` | Focus file explorer |
