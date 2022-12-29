local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.mason-lspconfig] Packer not found")
	return
end

packer.use({
	"williamboman/mason-lspconfig.nvim",
	disable = true,
	opt = false,
	config = function()
		local servers = {
			"ansiblels",
			"bashls",
			"bufls",
			"eslint",
			"sumneko_lua",
			"rust_analyzer",
			"golangci_lint_ls",
			"jsonls",
			"gopls",
			"pyright",
			"yamlls",
			"tsserver",
			"terraformls",
			"tflint",
			"taplo",
			"stylelint_lsp",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})
	end,
})
