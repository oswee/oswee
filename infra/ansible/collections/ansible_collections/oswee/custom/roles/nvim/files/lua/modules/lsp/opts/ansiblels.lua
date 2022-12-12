local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	local errmsg = "[LSP] `nvim-lspconfig` plugin not installed! Please install via your plugin manager."
	vim.api.nvim_err_writeln(errmsg)
	return
end

return {
	filetypes = { "yaml.ansible" },
	single_file_support = true,
	autostart = true,
	root_dir = lspconfig.util.root_pattern("ansible.cfg", ".ansible-lint.yaml", ".ansible-lint"),
}
