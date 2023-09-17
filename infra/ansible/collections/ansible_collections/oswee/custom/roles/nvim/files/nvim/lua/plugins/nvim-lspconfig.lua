return {
	'neovim/nvim-lspconfig',
	enabled = true,
	lazy = false,
	config = function()
		local lspconfig = require('lspconfig')

		local servers = {
			'ansiblels',
			'bashls',
			'bufls',
			'cssls',
			'cssmodules_ls',
			'golangci_lint_ls',
			'gopls',
			'html',
			'helm_ls',
			'jsonls',
			'lua_ls',
			'marksman',
			'pyright',
			'rust_analyzer',
			'stylelint_lsp',
			'terraformls',
			'tsserver',
			'yamlls',
		}

		for _, server in pairs(servers) do
			local opts = {
				-- Callback function that will be executed when a language server is attached to a buffer.
				-- It is recommended that we set our keybindings and commands in this function
				on_attach = require('plugins.lsp.handlers').on_attach,
				-- Announce to the LSP server what features this editor supports
				capabilities = require('plugins.lsp.handlers').capabilities,
				-- flags = lsp_flags,
				require('plugins.lsp.handlers').setup(),
			}

			local has_custom_opts, custom_server_opts = pcall(require, 'plugins.lsp.opts.' .. server)
			if has_custom_opts then
				opts = vim.tbl_deep_extend('force', custom_server_opts, opts) -- Override defaults (force/keep)
			end

			lspconfig[server].setup(opts)
		end

	end,
	keys = {
		vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', { silent = true, desc = 'lsp | Connected language servers' }),
		vim.keymap.set('n', '<leader>ll', '<cmd>LspLog<cr>', { silent = true, desc = 'lsp | Log' }),
		vim.keymap.set(
			'n',
			'<leader>lw',
			'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
			{ silent = true, desc = 'lsp | List workspace folders' }
		)
	}
}
