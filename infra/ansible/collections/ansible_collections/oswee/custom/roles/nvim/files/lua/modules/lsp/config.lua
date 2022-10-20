local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	local errmsg = "[LSP] `nvim-lspconfig` plugin not installed! Please install via your plugin manager."
	vim.api.nvim_err_writeln(errmsg)
	return
end

local servers = {
	"sumneko_lua",
	"cssls",
	-- 'efm',
	"gopls",
	-- 'golangci_lint_ls',
	"tsserver",
	-- "yamlls",
	-- 'ansiblels',
	-- "bashls",
	-- 'pyright',
	-- 'html',
	"jsonls",
	"stylelint_lsp",
	-- "rust_analyzer",
	-- "terraformls",
}

for _, server in pairs(servers) do
	local opts = {
		-- Callback function that will be executed when a language server is attached to a buffer.
		-- It is recommended that we set our keybindings and commands in this function
		on_attach = require("modules.lsp.handlers").on_attach,
		-- Announce to the LSP server what features this edditor supports
		capabilities = require("modules.lsp.handlers").capabilities,
		require("modules.lsp.handlers").setup(),
	}

	local has_custom_opts, custom_server_opts = pcall(require, "modules.lsp.opts." .. server)
	if has_custom_opts then
		-- opts = vim.tbl_deep_extend('force', custom_server_opts, opts)  -- Override defaults (force/keep)
		opts = vim.tbl_deep_extend("force", opts, custom_server_opts) -- Override defaults (force/keep)
	end

	lspconfig[server].setup(opts)
end
