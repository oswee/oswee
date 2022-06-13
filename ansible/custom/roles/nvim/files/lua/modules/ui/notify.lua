local ok, notify = pcall(require, "notify")
if not ok then
	local errmsg = "[UI] `notify` plugin not installed! Please install via your plugin manager."
	vim.api.nvim_err_writeln(errmsg)
	return
end

vim.notify = notify
