vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- I DON'T LIKE THIS TO BE THERE

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>r', ':NvimTreeRefresh<CR>')
vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFile<CR>')

vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>fh', ':Telescope help_tags<CR>')

vim.keymap.set('n', '<Leader>gg', ':LazyGit<CR>')

vim.keymap.set('n', '<Leader><Leader>s', '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

-- local opts = { noremap=true, silent=true }

-- map('n', '<Leader>cf', ':Lspsaga lsp_finder<CR>', opts)
-- map('n', '<Leader>ca', ':Lspsaga code_action<CR>', opts)
-- map('v', '<Leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
-- map('n', '<Leader>ch', ':Lspsaga hover_doc<CR>', opts)
-- map('n', '<Leader>ck', '<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>', opts)
-- map('n', '<Leader>cj', '<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>', opts)
-- map('n', '<Leader>cs', ':Lspsaga signature_help<CR>', opts)
-- map('n', '<Leader>ci', ':Lspsaga show_line_diagnostics<CR>', opts)
-- map('n', '<Leader>cc', ':Lspsaga show_cursor_diagnostics<CR>', opts)
-- map('n', '<Leader>cn', ':Lspsaga diagnostic_jump_next<CR>', opts)
-- map('n', '<Leader>cp', ':Lspsaga diagnostic_jump_prev<CR>', opts)
-- map('n', '<Leader>cr', ':Lspsaga rename<CR>', opts)
-- map('n', '<Leader>cd', ':Lspsaga preview_definition<CR>', opts)

-- vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', { buffer = 0 })
