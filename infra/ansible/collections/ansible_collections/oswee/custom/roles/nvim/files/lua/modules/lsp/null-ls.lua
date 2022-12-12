local packer_installed, packer = pcall(require, 'packer')
if not packer_installed then
	vim.api.nvim_err_writeln('[modules.lsp.null-ls] Packer not found')
	return
end

packer.use({
	'jose-elias-alvarez/null-ls.nvim',
	disable = false,
	opt = false,
	requires = {
		{ 'nvim-lua/plenary.nvim' },
	},
	config = function()
		local ok, null_ls = pcall(require, 'null-ls')
		if not ok then
			local msg = '[LSP] `null-ls` plugin not installed! Please install via your plugin manager.'
			vim.api.nvim_err_writeln(msg)
			return
		end

		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

		null_ls.setup({
			debug = true,
			debounce = 150,
			autostart = true,
			save_after_format = false,
			sources = {

				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.diagnostics.eslint_d,

				null_ls.builtins.formatting.prettierd,

				-- null_ls.builtins.completion.spell,

				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofmt,

				-- null_ls.builtins.formatting.stylelint,
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.diagnostics.buf,
				null_ls.builtins.diagnostics.buildifier,
				null_ls.builtins.formatting.buildifier,
				null_ls.builtins.diagnostics.yamllint,
				-- null_ls.builtins.formatting.yamlfmt, -- Quite limited experience (document_end, spaces for inline comments, etc)
				null_ls.builtins.formatting.terraform_fmt,
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
				client.server_capabilities.document_formatting = true
				client.server_capabilities.document_range_formatting = true
			end,
		})
	end,
})
