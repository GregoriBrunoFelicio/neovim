vim.pack.add({
    {
        src = "https://github.com/stevearc/oil.nvim",
    },
})

require("oil").setup({
    default_file_explorer = true,

    columns = {
        "icon",
    },

    view_options = {
        show_hidden = true,
    },

    keymaps = {
        ["<CR>"] = "actions.select",

        ["<C-v>"] = {
            "actions.select",
            opts = { vertical = true },
        },

        ["<C-s>"] = {
            "actions.select",
            opts = { horizontal = true },
        },

        ["-"] = "actions.parent",

        ["q"] = "actions.close",
    },
})

vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>")

