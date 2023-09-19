return {
	'vuki656/package-info.nvim',
	enabled = true,
	lazy = true,
	dependencies = {
		'MunifTanjim/nui.nvim',
	},
	config = function()
		local plugin = require('package-info')

		plugin.setup({
			autostart = true,
		})
	end,
}
