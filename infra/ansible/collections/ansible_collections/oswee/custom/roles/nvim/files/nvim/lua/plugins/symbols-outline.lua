return {
	'simrat39/symbols-outline.nvim',
	enabled = true,
	lazy = false,
	keys = {
		{ '<leader>st', '<cmd>SymbolsOutline<cr>', desc = 'symbols-outline | Toggle' },
		{ '<leader>so', '<cmd>SymbolsOutlineOpen<cr>', desc = 'symbols-outline | Open' },
		{ '<leader>sc', '<cmd>SymbolsOutlineClose<cr>', desc = 'symbols-outline | Close' },
	},
	config = function()
		local plugin = require('symbols-outline')

		plugin.setup({
			show_numbers = true,
		})
	end,
}
