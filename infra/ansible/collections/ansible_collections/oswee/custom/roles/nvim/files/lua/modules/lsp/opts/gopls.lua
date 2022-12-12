local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

return {
	root_dir = function(fname)
		return lspconfig.util.root_pattern("go.work")(fname) or lspconfig.util.root_pattern("go.mod", ".git")(fname)
	end,
	settings = {
		Go = {
			default_config = {
				cmd = { "gopls" },
				filetypes = { "go", "gomod" },
			},
		},
	},
}
