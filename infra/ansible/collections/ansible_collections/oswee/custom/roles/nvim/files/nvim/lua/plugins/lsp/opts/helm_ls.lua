local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	return
end

return {
	root_dir = require("lspconfig").util.root_pattern("Chart.yaml"),
	cmd = { 'helm_ls', 'serve' },
	filetypes = { 'helm' },
	single_file_support = true,
}
