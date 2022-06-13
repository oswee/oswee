vim.g.NERDTreeWinPos = "left" -- wheen splitright=false open the file tree in the left side.

vim.keymap.set("n", "<Leader>n", "<cmd>NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", "<cmd>NERDTree<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>NERDTreeFind<CR>")
