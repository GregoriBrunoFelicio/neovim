vim.g.mapleader = " "

require("config.options")
require("config.filetypes")

-- Plugins
require("plugins.colorscheme")
require("plugins.mason-nvim")
require("plugins.roslyn-nvim")
require("plugins.telescope-nvim")
require("plugins.nvim-dap")
require("plugins.conform-nvim")
require("plugins.oil")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.which-key")
require("plugins.nvim-treesitter")
require("plugins.fidget")
require("plugins.nvim-autopairs")

-- LSP
require("config.lsp")

vim.lsp.enable("roslyn")
