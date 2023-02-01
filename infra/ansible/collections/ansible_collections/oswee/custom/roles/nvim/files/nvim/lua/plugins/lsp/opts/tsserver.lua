local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	local errmsg = "[LSP] `nvim-lspconfig` plugin not installed! Please install via your plugin manager."
	vim.api.nvim_err_writeln(errmsg)
	return
end

local on_attach = function(client)
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end
	client.server_capabilities.document_formatting = true
end

return {
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"typescript",
	},
	settings = {
		tsserver = {
			useBatchedBufferSync = true,
		},
		javascript = {
			autoClosingTags = true,
			suggest = {
				autoImports = true,
			},
			updateImportsOnFileMove = {
				enable = true,
			},
			suggestionActions = {
				enabled = false,
			},
		},
	},
}
