return {
    "andymass/vim-matchup",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
        matchparen = { offscreen = {} },
        treesitter = {
            stopline = 500,
        },
    },
}
