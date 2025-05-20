return {
    "EdenEast/nightfox.nvim",
    config = function()
        local nightfox = require("nightfox")
        nightfox.setup({
            options = {
                styles = {
                    comments = "italic",
                    keywords = "bold",
                },
            },
        })
        vim.cmd("colorscheme dayfox")
    end,
}
