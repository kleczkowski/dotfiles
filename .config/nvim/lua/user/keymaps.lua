local function bind(mode, key, op)
  local opts = {
    noremap = true,
    silent = true
  }
  vim.api.nvim_set_keymap(mode, key, op, opts)
end

-- Leader --
vim.cmd [[
  nnoremap <Space> <Nop>
  let mapleader="\<Space>"
]]

-- Normal mode --
-- Split navigation
bind("n", "<C-h>", "<C-w>h")
bind("n", "<C-j>", "<C-w>j")
bind("n", "<C-k>", "<C-w>k")
bind("n", "<C-l>", "<C-w>l")

-- Split resizing
bind("n", "<C-Up>", "<Cmd>resize -2<CR>")
bind("n", "<C-Down>", "<Cmd>resize +2<CR>")
bind("n", "<C-Left>", "<Cmd>vertical resize -2<CR>")
bind("n", "<C-Right>", "<Cmd>vertical resize +2<CR>")

-- Buffer navigation
bind("n", "<S-l>", "<Cmd>bnext<CR>")
bind("n", "<S-h>", "<Cmd>bprevious<CR>")

-- Moving text
bind("n", "<A-k>", "<Esc>:m .-2<CR>==gi")
bind("n", "<A-j>", "<Esc>:m .+1<CR>==gi")

-- Insert mode --
-- Exit from insert presssing 'jk' quickly
bind("i", "jk", "<ESC>")

-- Visual mode --
-- Stay in indent mode
bind("v", "<", "<gv")
bind("v", ">", ">gv")

-- Move text up and down
bind("v", "<A-j>", ":m .+1<CR>==")
bind("v", "<A-k>", ":m .-2<CR>==")
bind("v", "p", '"_dP')

-- Visual Block mode --
-- Move text up and down
bind("x", "J", ":move '>+1<CR>gv-gv")
bind("x", "K", ":move '<-2<CR>gv-gv")
bind("x", "<A-j>", ":move '>+1<CR>gv-gv")
bind("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Telescope --
bind("n", "<Leader>ff", "<Cmd>Telescope git_files<CR>")
bind("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
bind("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
bind("n", "<Leader>fw", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
bind("n", "<Leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>")
bind("n", "<Leader>fi", "<Cmd>Telescope lsp_implementations<CR>")
bind("n", "<Leader>fd", "<Cmd>Telescope lsp_definitions<CR>")
bind("n", "<Leader>fr", "<Cmd>Telescope lsp_references<CR>")

-- nvim-tree --
bind("n", "<Leader>e", "<Cmd>NvimTreeFocus<CR>")

-- trouble --
bind("n", "<Leader>xx", "<Cmd>TroubleToggle<CR>")
bind("n", "<Leader>xw", "<Cmd>TroubleToggle workspace_diagnostics<CR>")
bind("n", "<Leader>xd", "<Cmd>TroubleToggle document_diagnostics<CR>")
bind("n", "<Leader>xq", "<Cmd>TroubleToggle quickfix<CR>")
bind("n", "<Leader>xl", "<Cmd>TroubleToggle loclist<CR>")
