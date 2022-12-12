local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.nvim-lspconfig] Packer not found")
	return
end

packer.use({
	"neovim/nvim-lspconfig",
	disable = false,
	opt = false,
	config = function()
		local ok, lspconfig = pcall(require, "lspconfig")
		if not ok then
			local errmsg = "[LSP] `nvim-lspconfig` plugin not installed! Please install via your plugin manager."
			vim.api.nvim_err_writeln(errmsg)
			return
		end

		local servers = {
			"sumneko_lua",
			-- 'html',
			"cssls",
			-- 'efm',
			"gopls",
			"golangci_lint_ls",
			"tsserver",
			"yamlls",
			"ansiblels",
			"bashls",
			"pyright",
			"jsonls",
			"stylelint_lsp",
			"rust_analyzer",
			"terraformls",
		}

		for _, server in pairs(servers) do
			local opts = {
				-- Callback function that will be executed when a language server is attached to a buffer.
				-- It is recommended that we set our keybindings and commands in this function
				on_attach = require("modules.lsp.handlers").on_attach,
				-- Announce to the LSP server what features this edditor supports
				capabilities = require("modules.lsp.handlers").capabilities,
				-- flags = lsp_flags,
				-- require("modules.lsp.handlers").setup(),
			}

			local has_custom_opts, custom_server_opts = pcall(require, "modules.lsp.opts." .. server)
			if has_custom_opts then
				-- opts = vim.tbl_deep_extend('force', custom_server_opts, opts)  -- Override defaults (force/keep)
				opts = vim.tbl_deep_extend("force", opts, custom_server_opts) -- Override defaults (force/keep)
				-- for k, v in pairs(opts) do
				-- 	print(k, v, "END")
				-- end
			end

			-- print(opts)
			lspconfig[server].setup(opts)
		end

		-- require("lspconfig").sumneko_lua.setup({})
		-- require("lspconfig").ansiblels.setup({})
		-- require("lspconfig").cssls.setup({})
		-- require("lspconfig").gopls.setup({})
		-- require("lspconfig").golangci_lint_ls.setup({})
		-- require("lspconfig").terraformls.setup({})
		-- require("lspconfig").jsonls.setup({})
		-- require("lspconfig").stylelint_lsp.setup({})

		vim.keymap.set(
			"n",
			"<leader>ll",
			"<cmd>LspInfo<cr>",
			{ silent = true, desc = "lsp | Connected language servers" }
		)
		vim.keymap.set(
			"n",
			"<leader>lk",
			"<cmd>lua vim.lsp.buf.signature_help()<cr>",
			{ silent = true, desc = "lsp | Signature help" }
		)
		vim.keymap.set(
			"n",
			"<leader>lw",
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
			{ silent = true, desc = "lsp | List workspace folders" }
		)
	end,
})
