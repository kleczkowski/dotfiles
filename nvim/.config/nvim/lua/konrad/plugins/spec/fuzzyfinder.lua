return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        { "folke/todo-comments.nvim" },
        "ThePrimeagen/harpoon",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod

        local trouble = require("trouble")
        local trouble_telescope = require("trouble.sources.telescope")

        local custom_actions = transform_mod({
            open_trouble_qflist = function(_)
                trouble.toggle("quickfix")
            end,
        })

        telescope.setup({
            path_display = { "smart" },
            mappings = {
                i = {
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                    ["<C-t>"] = trouble_telescope.open,
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<Leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<Leader>fs", "<Cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
        keymap.set("n", "<Leader>fc", "<Cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Find buffer" })
        keymap.set("n", "<Leader>fm", "<Cmd>Telescope marks<CR>", { desc = "Find bookmarks" })
        keymap.set("n", "<Leader>fg", "<Cmd>Telescope registers<CR>", { desc = "Find registers" })
        keymap.set("n", "<Leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Find registers" })

        local harpoon = require("harpoon")

        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({

                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        vim.keymap.set("n", "<Leader>fh", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Open harpoon window" })
    end,
}
