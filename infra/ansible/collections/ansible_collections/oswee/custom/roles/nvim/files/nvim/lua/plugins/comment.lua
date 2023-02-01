return {
	'numToStr/Comment.nvim',
	enabled = true,
	lazy = false,
	config = function()
		local plugin = require('Comment')

		plugin.setup({
			mappings = {
				basic = true,
				extra = true,
			},
		})
	end,
}
