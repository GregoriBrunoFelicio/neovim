vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local buf = { buffer = ev.buf }

        vim.keymap.set("n", "K",            vim.lsp.buf.hover,            buf)
        vim.keymap.set("n", "<leader>gd",   vim.lsp.buf.definition,       buf)
        vim.keymap.set("n", "<leader>gr",   vim.lsp.buf.references,       buf)
        vim.keymap.set("n", "<leader>ca",   vim.lsp.buf.code_action,      buf)

        -- Visual Studio style
        vim.keymap.set("n", "<F12>",        vim.lsp.buf.definition,       buf)
        vim.keymap.set("n", "<C-F12>",      vim.lsp.buf.implementation,   buf)
        vim.keymap.set("n", "<S-F12>",      vim.lsp.buf.references,       buf)
        vim.keymap.set({ "n", "i" }, "<C-.>", vim.lsp.buf.code_action,    buf)
        vim.keymap.set("n", "<F2>",         vim.lsp.buf.rename,           buf)
        vim.keymap.set("i", "<C-S-Space>",  vim.lsp.buf.signature_help,   buf)

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, buf)
        end
    end,
})

-- Visual Studio style diagnostic navigation
vim.keymap.set("n", "<F8>",   vim.diagnostic.goto_next)
vim.keymap.set("n", "<S-F8>", vim.diagnostic.goto_prev)

vim.diagnostic.config({
    virtual_lines = { current_line = true },
})
