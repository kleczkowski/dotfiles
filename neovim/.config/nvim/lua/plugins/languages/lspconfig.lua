return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "folke/neodev.nvim", opts = {} },
        },
        opts = {
            servers = {
                hls = {
                    haskell = {
                        formattingProvider = "fourmolu",
                    },
                },
                clangd = {},
                ocamllsp = {},
                rust_analyzer = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
                lua_ls = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local keymap = vim.keymap -- for conciseness

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local key_opts = { buffer = ev.buf, silent = true }

                    key_opts.desc = "Show LSP references"
                    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", key_opts)

                    key_opts.desc = "Go to declaration"
                    keymap.set("n", "gD", vim.lsp.buf.declaration, key_opts)

                    key_opts.desc = "Show LSP definitions"
                    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", key_opts)

                    key_opts.desc = "Show LSP implementations"
                    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", key_opts)

                    key_opts.desc = "Show LSP type definitions"
                    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", key_opts)

                    key_opts.desc = "Show LSP document symbols"
                    keymap.set("n", "<Leader>fd", "<Cmd>Telescope lsp_document_symbols<CR>", key_opts)

                    key_opts.desc = "See available code actions"
                    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, key_opts)

                    key_opts.desc = "Smart rename"
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, key_opts)

                    key_opts.desc = "Show buffer diagnostics"
                    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", key_opts)

                    key_opts.desc = "Show line diagnostics"
                    keymap.set("n", "<leader>d", vim.diagnostic.open_float, key_opts)

                    key_opts.desc = "Go to previous diagnostic"
                    keymap.set("n", "[d", function()
                        vim.diagnostic.jump({ count = -1 })
                    end, key_opts)

                    key_opts.desc = "Go to next diagnostic"
                    keymap.set("n", "]d", function()
                        vim.diagnostic.jump({ count = 1 })
                    end, key_opts)

                    key_opts.desc = "Show documentation for what is under cursor"
                    keymap.set("n", "K", vim.lsp.buf.hover, key_opts)

                    key_opts.desc = "Restart LSP"
                    keymap.set("n", "<leader>rs", ":LspRestart<CR>", key_opts)
                end,
            })

            local lvl = vim.diagnostic.severity
            vim.diagnostic.config({
                virtual_text = { prefix = "" },
                signs = {
                    text = {
                        [lvl.ERROR] = " ",
                        [lvl.WARN] = " ",
                        [lvl.HINT] = "",
                        [lvl.INFO] = " ",
                    },
                },
                underline = true,
            })

            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- mason_lspconfig.setup_handlers({
            --     function(name, settings)
            --         lspconfig[name].setup({
            --             capabilities = capabilities,
            --             settings = settings,
            --         })
            --     end,
            -- })

            for name, settings in pairs(opts.servers) do
                lspconfig[name].setup({
                    capabilities = capabilities,
                    settings = settings,
                })
            end
        end,
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                },
            })

            mason_lspconfig.setup({
                automatic_installation = true,
                ensure_installed = {
                    "lua_ls",
                },
            })

            mason_tool_installer.setup({
                ensure_installed = {
                    "stylua",
                },
            })
        end,
    },
}
