local ok, _ = pcall(require, 'gruvbox')
if not ok then
	local errmsg = '[UI] `gruvbox` plugin not installed! Please install via your plugin manager.'
	vim.api.nvim_err_writeln(errmsg)
	return
end

vim.opt.background = 'dark'
vim.cmd([[colorscheme gruvbox]])
-- vim.g.gruvbox_invert_selection = 0
-- vim.g.gruvbox_contrast_dark = "hard"
