local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

-- Examples:
-- https://github.com/agusthas/dotfiles/blob/85fbfcfb77ef668997dfdca8fd8681298d3abefa/nvim/.config/nvim/lua/config/treesitter.lua

treesitter.setup({
	ensure_installed = {
		'bash',
		'comment',
		'css',
		'go',
		'gomod',
		'gowork',
		'hcl',
		'html',
		'javascript',
		'jsdoc',
		'json',
		'json5',
		'lua',
		'make',
		'markdown',
		'php',
		'proto',
		'python',
		'regex',
		'rust',
		'scss',
		'toml',
		'typescript',
		'vim',
		'yaml',
	},
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true, -- Will disable all HL. Check with :TSModuleInfo
		disable = {},
		-- additional_vim_regex_highlighting = false,
		additional_vim_regex_highlighting = { 'markdown' },
	},
	indent = { enable = true },
	-- additional_vim_regex_highlighting = { "markdown" },
})

-- Enable folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
