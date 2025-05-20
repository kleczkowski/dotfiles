return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = { char = "┊" },
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    { "alexghergh/nvim-tmux-navigation" },
}
