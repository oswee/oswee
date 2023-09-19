return {
	'gelguy/wilder.nvim',
	enabled = true,
	lazy = false,
	-- build = ':TSUpdate',
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
	config = function()
		local wilder = require('wilder')

		wilder.setup({ modes = { ':', '/', '?' } })
		wilder.set_option('renderer', wilder.popupmenu_renderer({
			highlighter = wilder.basic_highlighter(),
			-- left = { ' ', wilder.popupmenu_devicons() },
			-- right = { ' ', wilder.popupmenu_scrollbar() },
		}))
	end,
}
