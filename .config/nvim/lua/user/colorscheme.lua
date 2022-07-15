vim.cmd [[
  try
    colorscheme monokai_pro
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
