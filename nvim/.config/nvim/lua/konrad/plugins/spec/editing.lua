return {
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function()
            -- import nvim-autopairs
            local autopairs = require("nvim-autopairs")

            -- configure autopairs
            autopairs.setup({
                check_ts = true, -- enable treesitter
            })

            -- import nvim-autopairs completion functionality
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")

            -- import nvim-cmp plugin (completions plugin)
            local cmp = require("cmp")

            -- make autopairs and completion work together
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "gbprod/substitute.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local substitute = require("substitute")

            substitute.setup()

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
            keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
            keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
            keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require("todo-comments")
            todo_comments.setup()
            local keymap = vim.keymap
            keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "Next todo comment" })
            keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "Next todo comment" })
        end,
    },
}
