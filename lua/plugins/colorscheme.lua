vim.pack.add({
    {
        src = "https://github.com/Mofiqul/vscode.nvim",
        version = "main",
    },
})

vim.cmd("packadd vscode.nvim")

require("vscode").setup({
    style = "dark",
    transparent = false,
    italic_comments = true,
})

vim.cmd.colorscheme("vscode")
