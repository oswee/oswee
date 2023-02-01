return {
	'folke/which-key.nvim',
	enabled = true,
	lazy = false,
	config = function()
		local plugin = require('which-key')

		plugin.setup({})
	end,
}
