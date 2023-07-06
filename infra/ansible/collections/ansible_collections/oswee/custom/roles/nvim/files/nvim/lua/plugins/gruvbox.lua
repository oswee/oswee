return {
	'ellisonleao/gruvbox.nvim',
	enabled = true,
	lazy = false,
	priority = 1000,
	dependencies = {
		'rktjmp/lush.nvim',
	},
	config = function()
		local plugin = require('gruvbox')
		plugin.setup({
			contrast = 'hard',
			italic = {
				strings = true,
				operators = true,
				comments = true,
			}
		})

		vim.opt.background = 'dark'
		vim.cmd([[colorscheme gruvbox]])
	end,
}
