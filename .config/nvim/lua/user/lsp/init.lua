local lsp_ok, _ = pcall(require, "lspconfig")
if not lsp_ok then
  vim.notify("LSP config not loaded...")
  return
end

require("user.lsp.installer")
require("user.lsp.handlers").setup()
