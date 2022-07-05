local options = {
  fileencoding = "utf-8",
  backup = false,
  swapfile = false,
  writebackup = false,
  undofile = true,
  wildmenu = true,

  hlsearch = true,
  ignorecase = true,

  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,

  number = true,
  relativenumber = true,
  numberwidth = 4,
  foldmethod = "marker",

  mouse = "a",
  clipboard = "unnamedplus",
  cursorline = true,
  termguicolors = true,
  wrap = false,
  timeoutlen = 250,
  updatetime = 300,
  scrolloff = 8,
  sidescrolloff = 8,
}

-- Workaround for 80th column highlight
vim.cmd [[
  au VimEnter * set colorcolumn=80
]]

-- Use win32yank to operate with Windows clipboard
if os.getenv('WSL_DISTRO_NAME') ~= nil then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

vim.cmd [[
  set whichwrap+=<,>,[,],h,l"
  set iskeyword+=-
  set formatoptions-=cro
]]

for k, v in pairs(options) do
  vim.opt[k] = v
end
