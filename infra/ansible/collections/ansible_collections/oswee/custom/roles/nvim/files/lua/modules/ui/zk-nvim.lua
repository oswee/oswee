local ok, zk = pcall(require, 'zk')
if not ok then
	local errmsg = '[UI]: `zk` plugin not installed! Please install via your plugin manager.'
	vim.api.nvim_err_writeln(errmsg)
	return
end

local commands = require('zk.commands')

zk.setup({
	picker = 'telescope',

	lsp = {
		-- `config` is passed to `vim.lsp.start_client(config)`
		config = {
			cmd = { 'zk', 'lsp', '--log', '/tmp/zk-lsp.log' },
			name = 'zk',
			-- on_attach = ...
			-- etc, see `:h vim.lsp.start_client()`
		},

		-- automatically attach buffers in a zk notebook that match the given filetypes
		auto_attach = {
			enabled = true,
			filetypes = { 'markdown' },
		},
	},
})

local function make_new_fn(defaults)
	return function(options)
		options = vim.tbl_extend('force', defaults, options or {})
		zk.new(options)
	end
end

commands.add('ZkNewDaily', make_new_fn({ dir = 'journal/daily' }))
