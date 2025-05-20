return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = function()
        require("lualine").setup({
            options = {
                theme = "auto",
            },
        })
    end,
}
