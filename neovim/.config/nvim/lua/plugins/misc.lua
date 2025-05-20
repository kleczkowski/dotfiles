return {
    { "nvim-lua/plenary.nvim" },
    {
        "aserowy/tmux.nvim",
        config = function()
            local tmux = require("tmux")
            tmux.setup()
        end,
    },
}
