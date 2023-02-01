return {
	'nvim-lualine/lualine.nvim',
	enabled = true,
	lazy = false,
	dependencies = {
		'kyazdani42/nvim-web-devicons',
		'arkav/lualine-lsp-progress',
	},
	config = function()
		local plugin = require('lualine')

		plugin.setup({
			options = {
				theme = 'gruvbox',
				disabled_filetypes = {
					statusline = { 'alpha', 'dashboard', 'NvimTree', 'NERDTree', 'Outline' },
					winbar = { 'NvimTree', 'Trouble', 'alpha', 'Outline' },
				},
			},
		})
	end,
}
