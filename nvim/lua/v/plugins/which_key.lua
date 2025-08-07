return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>a", group = "[AI]", nowait = true, remap = false },
            { "<leader>b", group = "[Buffer]", nowait = true, remap = false },
            { "<leader>f", group = "[Telescope]", nowait = true, remap = false },
            { "<leader>g", group = "[Git]", nowait = true, remap = false },
            { "<leader>l", group = "[LSP]", nowait = true, remap = false },
            { "<leader>lt", group = "[Typescript]", nowait = true, remap = false },
            { "<leader>q", group = "[QuickFix]", nowait = true, remap = false },
        })

        wk.setup({
            icons = {
                breadcrumb = "󰫍 ",
                separator = " ",
                group = "+ ",
            },
            replace = {
                ["<space>"] = "SPACE",
                ["<leader>"] = "SPACE",
                ["<cr>"] = "RETURN",
                ["<tab>"] = "TAB",
            },
        })
    end,
}
