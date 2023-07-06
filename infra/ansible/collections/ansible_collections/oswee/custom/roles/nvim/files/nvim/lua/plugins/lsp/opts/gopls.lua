local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

return {
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	single_file_support = true,
}
