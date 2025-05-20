return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        { "folke/todo-comments.nvim" },
    },
    cmd = "Telescope",
    keys = {
        { "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Fuzzy find files in cwd" },
        { "<Leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Fuzzy find recent files" },
        { "<Leader>fs", "<Cmd>Telescope live_grep<CR>", desc = "Find string in cwd" },
        { "<Leader>fc", "<Cmd>Telescope grep_string<CR>", desc = "Find string under cursor in cwd" },
        { "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Find buffer" },
        { "<Leader>fm", "<Cmd>Telescope marks<CR>", desc = "Find bookmarks" },
        { "<Leader>fg", "<Cmd>Telescope registers<CR>", desc = "Find registers" },
        { "<Leader>ft", "<Cmd>TodoTelescope<CR>", desc = "Find TODO comments" },
    },
    config = function()
        local telescope = require("telescope")
        local telescope_themes = require("telescope.themes")
        local actions = require("telescope.actions")
        local actions_layout = require("telescope.actions.layout")
        local transform_mod = require("telescope.actions.mt").transform_mod

        local trouble = require("trouble")
        local trouble_telescope = require("trouble.sources.telescope")

        local custom_actions = transform_mod({
            open_trouble_qflist = function(_)
                trouble.toggle("quickfix")
            end,
        })

        telescope.setup({
            defaults = telescope_themes.get_ivy(),
            path_display = { "smart" },
            mappings = {
                n = {
                    ["<M-p>"] = actions_layout.toggle_preview,
                },
                i = {
                    ["<Esc>"] = actions.close,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                    ["<C-t>"] = trouble_telescope.open,
                    ["<C-l>"] = false,
                    ["<M-p>"] = actions_layout.toggle_preview,
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
