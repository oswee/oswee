--  npm i -g vscode-langservers-extracted

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
	capabilities = capabilities,
	single_file_support = true,
	filetypes = {
		"css",
		"scss",
		"less",
	},
	settings = {
		css = {
			validate = true,
		},
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
}
