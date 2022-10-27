vim.g.NERDTreeWinPos = 'left' -- wheen splitright=false open the file tree in the left side.
vim.g.NERDTreeMinimalUI = true
vim.g.NERDTreeShowHidden = true
vim.g.NERDTreeAutoDeleteBuffer = true
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''
vim.g.NERDTreeWinSize = 34

vim.keymap.set('n', '<Leader>n', '<cmd>NERDTreeFocus<CR>')
vim.keymap.set('n', '<C-n>', '<cmd>NERDTree<CR>')
vim.keymap.set('n', '<C-t>', '<cmd>NERDTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', '<cmd>NERDTreeFind<CR>')
