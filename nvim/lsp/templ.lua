return {
    name = "templ",
    cmd = { "templ", "lsp" },
    root_dir = function(fname)
        return require("lspconfig.util").root_pattern("go.mod", ".git")(fname)
    end,
    filetypes = { "templ" },
    settings = {},
}