-- ./lua/plugins/nvim-dap.lua
vim.pack.add({
        { src = "https://github.com/mfussenegger/nvim-dap" },
        { src = "https://github.com/nvim-neotest/nvim-nio" },
        { src = "https://github.com/rcarriga/nvim-dap-ui" },
        { src = "https://github.com/NicholasMata/nvim-dap-cs" },
        { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
})

local dap = require("dap")
local dapui = require("dapui")

-- C/C++ debugger (codelldb)
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.expand("$MASON/bin/codelldb"),
        args = { "--port", "${port}" },
    },
}

local c_config = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
dap.configurations.c = c_config
dap.configurations.cpp = c_config

-- F# uses the same netcoredbg as C# (dap-cs sets up cs, mirror to fsharp)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fsharp",
    callback = function()
        if not dap.configurations.fsharp then
            dap.configurations.fsharp = dap.configurations.cs
        end
    end,
})

require("dapui").setup()
require("dap-cs").setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.before.attach.dapui_config = function()
        dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
        dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
end

vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<F5>", dap.continue, {})
vim.keymap.set("n", "<S-F5>", dap.stop, {})
vim.keymap.set("n", "<C-S-F5>", dap.restart, {})
vim.keymap.set("n", "<F11>", dap.step_into, {})
vim.keymap.set("n", "<F10>", dap.step_over, {})
vim.keymap.set("n", "<S-F11>", dap.step_out, {})
