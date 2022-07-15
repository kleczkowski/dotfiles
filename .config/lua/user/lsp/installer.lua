local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_ok then
  vim.notify("LSP installer not loaded...")
  return
end

lsp_installer.on_server_ready(
  function (server)
    local opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "hls" then
      local hls = require("user.lsp.settings.hls")
      opts = vim.tbl_deep_extend("force", hls, opts)
    end

    if server.name == "sumneko_lua" then
      local sumneko_opts = require("user.lsp.settings.sumneko_lua")
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "yamlls" then
      local yamlls = require("user.lsp.settings.yamlls")
      opts = vim.tbl_deep_extend("force", yamlls, opts)
    end

    server:setup(opts)
  end
)
