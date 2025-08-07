return {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
        ui = {
            width = 0.8,
            height = 0.8,
            icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "",
            },
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
        require("mason-tool-installer").setup({
            ensure_installed = {
                "bash-language-server",
                "css-lsp",
                "html-lsp",
                "json-lsp",
                "lua-language-server",
                "typescript-language-server",
                "yaml-language-server",
                "pyright",

                "shellcheck",
                "yamllint",

                "prettierd",
                "shfmt",
                "stylua",
            },
        })
    end,
}
