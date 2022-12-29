local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.null-ls] Packer not found")
	return
end

packer.use({
	"jose-elias-alvarez/null-ls.nvim",
	disable = false,
	opt = false,
	requires = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local ok, null_ls = pcall(require, "null-ls")
		if not ok then
			local msg = "[LSP] `null-ls` plugin not installed! Please install via your plugin manager."
			vim.api.nvim_err_writeln(msg)
			return
		end

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			debug = false,
			debounce = 150,
			autostart = true,
			save_after_format = false,
			sources = {

				formatting.eslint_d,
				formatting.prettierd,
				formatting.goimports,
				formatting.gofmt,
				formatting.stylua,
				formatting.buildifier,
				formatting.terraform_fmt,
				-- formatting.stylelint,
				-- formatting.yamlfmt, -- Quite limited experience (document_end, spaces for inline comments, etc)
				diagnostics.cspell,
				diagnostics.eslint_d,
				diagnostics.yamllint,
				diagnostics.buildifier,
				-- diagnostics.buf,
				code_actions.cspell,
				code_actions.proselint,
				code_actions.eslint_d,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
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
