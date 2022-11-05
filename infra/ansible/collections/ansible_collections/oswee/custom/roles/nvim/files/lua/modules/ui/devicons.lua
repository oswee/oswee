local ok, devicons = pcall(require, 'nvim-web-devicons')
if not ok then
	local errmsg = '[UI] `nvim-web-devicons` plugin not installed! Please install via your plugin manager.'
	vim.api.nvim_err_writeln(errmsg)
	return
end

devicons.setup({})
