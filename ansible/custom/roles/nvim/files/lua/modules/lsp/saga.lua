local ok, saga = pcall(require, "lspsaga")
if (not ok) then return end

-- local map = require('helpers.map').map

-- vim.notify('LspSaga config attached')

saga.init_lsp_saga({
  code_action_icon = " ",
  definition_preview_icon = "  ",
  diagnostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
})

-- local opts = { noremap=true, silent=true }

-- map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", opts)
-- map("n", "<Leader>ca", ":Lspsaga code_action<CR>", opts)
-- map("v", "<Leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
-- map("n", "<Leader>ch", ":Lspsaga hover_doc<CR>", opts)
-- map("n", "<Leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
-- map("n", "<Leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
-- map("n", "<Leader>cs", ":Lspsaga signature_help<CR>", opts)
-- map("n", "<Leader>ci", ":Lspsaga show_line_diagnostics<CR>", opts)
-- map("n", "<Leader>cc", ":Lspsaga show_cursor_diagnostics<CR>", opts)
-- map("n", "<Leader>cn", ":Lspsaga diagnostic_jump_next<CR>", opts)
-- map("n", "<Leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", opts)
-- map("n", "<Leader>cr", ":Lspsaga rename<CR>", opts)
-- map("n", "<Leader>cd", ":Lspsaga preview_definition<CR>", opts)
