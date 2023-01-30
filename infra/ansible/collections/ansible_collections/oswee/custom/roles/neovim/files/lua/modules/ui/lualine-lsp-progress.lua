local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[UI:dashboard] Packer is not installed")
	return
end

-- local ok, llp = pcall(require, "lualine_lsp_progress")
-- if not ok then
-- 	local errmsg = "[UI] `lualine-lsp-progress` plugin not installed! Please install via your plugin manager."
-- 	vim.api.nvim_err_writeln(errmsg)
-- 	return
-- end
--
-- llp.setup({})
