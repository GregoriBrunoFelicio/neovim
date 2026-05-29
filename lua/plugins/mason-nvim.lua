-- ./lua/plugins/mason-nvim.lua
vim.pack.add({
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/mason-org/mason.nvim.git" },
        { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
        { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup({
        registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
        },
})

require("mason-lspconfig").setup({
        automatic_enable = {
                exclude = { "omnisharp" },
        },
})
require("mason-tool-installer").setup({
        ensure_installed = {
                "roslyn",          -- C# LSP
                "netcoredbg",      -- .NET debugger (C# and F#)
                "csharpier",       -- C# formatter
                "clangd",          -- C/C++ LSP
                "codelldb",        -- C/C++ debugger
                "fsautocomplete",  -- F# LSP
                "fantomas",        -- F# formatter
        },
})
