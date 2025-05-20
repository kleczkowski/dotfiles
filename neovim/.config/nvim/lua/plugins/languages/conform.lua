return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    version = "v7.1.0",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                haskell = { "fourmolu" },
                rust = { "rustfmt" },
                python = { "autopep8" },
                cmake = { "cmake-format" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
