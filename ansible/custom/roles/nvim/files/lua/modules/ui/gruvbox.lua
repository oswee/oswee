local ok, _ = pcall(require, 'gruvbox')
if not ok then return end

vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')
vim.g.gruvbox_invert_selection = 0
