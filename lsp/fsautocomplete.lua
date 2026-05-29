return {
    cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
    filetypes = { "fsharp" },
    root_markers = {
        { "*.sln", "*.fsproj" },
        ".git",
    },
}
