local ok, null_ls = pcall(require, 'null-ls')
if not ok then
	local msg = '[LSP] `null-ls` plugin not installed! Please install via your plugin manager.'
	vim.notify(msg, 4)
	return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- https://sourcegraph.com/github.com/otahontas/dotfiles/-/blob/dot_config/nvim/lua/pluginsettings/null-ls.lua
local eslint_files = {
	'.eslintrc*',
	'package.json',
}

local eslint_condition = function(utils)
	return utils.has_file(eslint_files) or utils.root_has_file(eslint_files)
end

local eslint_cwd = function(params)
	local utils = require('null-ls.utils')
	return utils.root_pattern(eslint_files)(params.bufname)
end

local prettier_files = {
	'.prettierrc*',
	'package.json',
}

local prettier_condition = function(utils)
	return utils.has_file(prettier_files) or utils.root_has_file(prettier_files)
end

local prettier_cwd = function(params)
	local utils = require('null-ls.utils')
	return utils.root_pattern(prettier_files)(params.bufname)
end

-- local go_files = {
-- 	'go.mod',
-- }

-- local go_cwd = function(params)
-- 	local utils = require('null-ls.utils')
-- 	return utils.root_pattern(go_files)(params.bufname)
-- end

null_ls.setup({
	debug = true,
	debounce = 150,
	autostart = true,
	save_after_format = false,
	sources = {
		null_ls.builtins.code_actions.eslint_d.with({
			cwd = eslint_cwd,
			condition = eslint_condition,
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			cwd = eslint_cwd,
			condition = eslint_condition,
		}),
		null_ls.builtins.formatting.eslint_d.with({
			cwd = eslint_cwd,
			condition = eslint_condition,
		}),
		null_ls.builtins.formatting.prettierd.with({
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.config/.prettierrc.json'),
			},
			cwd = prettier_cwd,
			condition = prettier_condition,
		}),
		-- null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.gofmt,
		-- null_ls.builtins.formatting.stylelint,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.buf,
		null_ls.builtins.diagnostics.buildifier,
		null_ls.builtins.formatting.buildifier,
		null_ls.builtins.diagnostics.yamllint,
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
