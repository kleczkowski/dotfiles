vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smarttab = true
opt.smartindent = true
opt.wrap = false
opt.foldmethod = "marker"
opt.foldlevel = 99

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cmdheight = 0

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false
