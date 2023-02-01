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
			italic = false,
		})

		vim.opt.background = 'dark'
		vim.cmd([[colorscheme gruvbox]])
	end,
}
