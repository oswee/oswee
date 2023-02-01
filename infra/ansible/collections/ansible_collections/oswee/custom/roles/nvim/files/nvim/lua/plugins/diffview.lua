return {
	"sindrets/diffview.nvim",
	enabled = true,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()

	end,
	keys = {
		vim.keymap.set('n', '<leader>df', '<cmd>DiffviewFileHistory %<cr>', { silent = true, desc = 'diffview | File history' }),
		vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<cr>', { silent = true, desc = 'diffview | Close' }),
	}
}
