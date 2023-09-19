return {
	'jose-elias-alvarez/null-ls.nvim',
	enabled = true,
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local plugin = require('null-ls')
		local formatting = plugin.builtins.formatting
		local diagnostics = plugin.builtins.diagnostics
		local code_actions = plugin.builtins.code_actions
		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
		require('ca')

		plugin.setup({
			debug = true,
			debounce = 150,
			autostart = true,
			save_after_format = false,
			sources = {
				formatting.stylua,
				formatting.eslint_d,
				formatting.prettierd.with({
					update_on_insert = false,
					filetypes = {
						'javascript',
						'javascriptreact',
						'typescript',
						'typescriptreact',
						'vue',
						'less',
						'html',
						'json',
						'jsonc',
						-- 'yaml',
						'markdown',
						'markdown.mdx',
						'graphql',
						'handlebars',
						'svelte',
					},
					extra_args = { '--use-tabs' },
				}),
				formatting.goimports,
				formatting.gofmt,
				formatting.terraform_fmt,
				formatting.packer,
				formatting.buildifier,
				-- formatting.stylelint,
				-- formatting.yamlfmt, -- Google tool. Quite limited experience (document_end, spaces for inline comments, etc)

				diagnostics.cspell.with({
					disabled_filetypes = { 'NvimTree' },
					-- prefer_local = "node_modules/.bin",
					-- extra_args = {},
					-- extra_filetypes = {},
				}),
				diagnostics.eslint_d,
				diagnostics.buildifier,
				diagnostics.yamllint.with({
					extra_filetypes = { 'yaml.ansible' },
				}),
				-- diagnostics.buf,

				code_actions.eslint_d,
				code_actions.cspell,
				code_actions.gitsigns,
				-- code_actions.proselint,
				-- completion.spell,
			},
			on_attach = function(client, bufnr)
				if client.supports_method('textDocument/formatting') then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
				-- client.server_capabilities.document_formatting = true
				-- client.server_capabilities.document_range_formatting = true
			end,
		})
	end,
}
