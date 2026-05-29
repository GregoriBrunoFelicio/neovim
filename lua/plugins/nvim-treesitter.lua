vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
        build = ":TSUpdate",
    },
})

vim.cmd("packadd nvim-treesitter")

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'cs', 'c', 'cpp', 'fsharp' },
    callback = function()
        vim.treesitter.start()
    end,
})
