return {
	"EdenEast/nightfox.nvim",
	enabled = false,
	lazy = false,
	priority = 1000,
	config = function()
		local plugin = require("nightfox")

		plugin.setup({})

		vim.cmd([[colorscheme terafox]])
	end
}
