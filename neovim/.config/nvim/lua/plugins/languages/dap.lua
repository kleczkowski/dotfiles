return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
        {
            "<leader>d",
            group = "Debugger",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dt",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Continue",

            nowait = true,
            remap = false,
        },
        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "Step Into",
            nowait = true,
            remap = false,
        },
        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "Step Over",
            nowait = true,
            remap = false,
        },
        {
            "<leader>du",
            function()
                require("dap").step_out()
            end,
            desc = "Step Out",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dr",
            function()
                require("dap").repl.open()
            end,
            desc = "Open REPL",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dl",
            function()
                require("dap").run_last()
            end,
            desc = "Run Last",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dq",
            function()
                require("dap").terminate()
                require("dapui").close()
                require("nvim-dap-virtual-text").toggle()
            end,
            desc = "Terminate",
            nowait = true,
            remap = false,
        },
        {
            "<leader>db",
            function()
                require("dap").list_breakpoints()
            end,
            desc = "List Breakpoints",
            nowait = true,
            remap = false,
        },
        {
            "<leader>de",
            function()
                require("dap").set_exception_breakpoints({ "all" })
            end,
            desc = "Set Exception Breakpoints",
            nowait = true,
            remap = false,
        },
    },
    config = function()
        local mason_dap = require("mason-nvim-dap")
        local dap = require("dap")
        local ui = require("dapui")
        local dap_virtual_text = require("nvim-dap-virtual-text")

        -- Dap Virtual Text
        dap_virtual_text.setup({})

        mason_dap.setup({
            ensure_installed = {},
            automatic_installation = true,
            handlers = {
                function(config)
                    mason_dap.default_setup(config)
                end,
            },
        })

        -- Dap UI

        ui.setup()

        vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
