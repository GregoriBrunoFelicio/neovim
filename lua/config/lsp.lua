vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        vim.keymap.set("n", "K",           vim.lsp.buf.hover,       { buffer = ev.buf })
        vim.keymap.set("n", "<leader>gd",  vim.lsp.buf.definition,  { buffer = ev.buf })
        vim.keymap.set("n", "<leader>gr",  vim.lsp.buf.references,  { buffer = ev.buf })
        vim.keymap.set("n", "<leader>ca",  vim.lsp.buf.code_action, { buffer = ev.buf })

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, { buffer = ev.buf })
        end
    end,
})

vim.diagnostic.config({
    virtual_lines = { current_line = true },
})
