local ok, _ = pcall(require, 'gruvbox')
if not ok then return end

local vim    = vim
local cmd    = vim.cmd
local g      = vim.g

g.gruvbox_contrast_dark = 'hard'
cmd('colorscheme gruvbox')
g.gruvbox_invert_selection = 0
