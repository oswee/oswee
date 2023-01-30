-- Add the key mappings only for Markdown files in a zk notebook.
-- if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
-- 	local function map(...)
-- 		vim.api.nvim_buf_set_keymap(0, ...)
-- 	end
-- end

-- TODO: Leave the description
-- vim.keymap.set("n", "j", "gj")
-- vim.keymap.set("n", "k", "gk")

vim.opt_local.wrap = true -- Turn on wrap only for markdown files
vim.opt_local.foldenable = false
