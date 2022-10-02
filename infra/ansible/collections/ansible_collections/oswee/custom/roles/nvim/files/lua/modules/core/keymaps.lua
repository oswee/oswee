vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- I DON'T LIKE THIS TO BE THERE

-- LaziGit

-- LuaSnips

-- DAP keymaps should be global so that they can launch the DAP plugins
-- vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
-- vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
-- vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
-- vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
-- vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
-- vim.keymap.set("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- vim.keymap.set(
-- 	"n",
-- 	"<Leader>lp",
-- 	"<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
-- )
-- vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
-- vim.keymap.set("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")

-- Trouble
vim.keymap.set("n", "<Leader>xx", "<cmd>TroubleToggle<CR>")
vim.keymap.set("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
vim.keymap.set("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")
vim.keymap.set("n", "<Leader>xq", "<cmd>TroubleToggle quickfix<CR>")
vim.keymap.set("n", "<Leader>xl", "<cmd>TroubleToggle loclist<CR>")
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<CR>")

-- vim.keymap.set(
-- 	"n",
-- 	"<Leader>za",
-- 	"require('telekasten').search_notes({default_text=[[^aliases: \\\\[([a-zA-Z].*,\\\\s*)*]]})<CR>"
-- )

-- local opts = { noremap=true, silent=true }

-- vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', { buffer = 0 })