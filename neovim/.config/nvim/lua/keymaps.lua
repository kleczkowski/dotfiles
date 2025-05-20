vim.g.mapleader = "\\"

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<Cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<M-k>", "<Cmd>resize +2<CR>", { desc = "" })
keymap.set("n", "<M-j>", "<Cmd>resize -2<CR>", { desc = "" })
keymap.set("n", "<M-h>", "<Cmd>vertical resize -2<CR>", { desc = "" })
keymap.set("n", "<M-l>", "<Cmd>vertical resize +2<CR>", { desc = "" })

-- tab navigation
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffer navigation
keymap.set("n", "[b", "<Cmd>bprev<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "]b", "<Cmd>bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "[B", "<Cmd>bfirst<CR>", { desc = "Go to first buffer" })
keymap.set("n", "]B", "<Cmd>blast<CR>", { desc = "Go to last buffer" })
keymap.set("n", "<Leader><Tab>", "<Cmd>b #<CR>", { desc = "Switch to last opened buffer" })

-- qflist navigation
keymap.set("n", "[c", "<Cmd>cprev<CR>", { desc = "Go to previous quickfix error" })
keymap.set("n", "]c", "<Cmd>cnext<CR>", { desc = "Go to next quickfix error" })
keymap.set("n", "[C", "<Cmd>cfirst<CR>", { desc = "Go to first quickfix error" })
keymap.set("n", "]C", "<Cmd>clast<CR>", { desc = "Go to last quickfix error" })
