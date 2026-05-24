vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "q", ":cclose<CR>", { buffer = true, silent = true })
    end,
})

vim.keymap.set("n", "<C-k>c",    "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("x", "<C-k>c",    "gc",  { remap = true, desc = "Comment selection" })
vim.keymap.set("n", "<C-k><C-u>","gcc", { remap = true, desc = "Uncomment line" })
vim.keymap.set("x", "<C-k><C-u>","gc",  { remap = true, desc = "Uncomment selection" })
