return {
	'lewis6991/gitsigns.nvim',
	enabled = true,
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local plugin = require('gitsigns')

		plugin.setup({})
	end,
}
