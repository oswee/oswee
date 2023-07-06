return {
	'lukas-reineke/indent-blankline.nvim',
	enabled = true,
	lazy = false,
	config = function()
		local plugin = require('indent_blankline')

		plugin.setup({
			char_list = { '|', '¦', '┆', '┊' },
			filetype_exclude = {
				'',
				'dashboard',
				'terminal',
				'help',
				'packer',
				'NvimTree',
				'sagahover',
				'markdown',
				'undotree',
			},
			buftype_exclude = { 'terminal' },
			show_first_indent_level = true,
			show_trailing_blankline_indent = true,
			show_end_of_line = true,
			space_char_blankline = ' ',
			indentLine_setColors = 1,
			use_treesitter = true,
			use_treesitter_scope = true,
			show_current_context = true,
			show_current_context_start = true,
		})
	end,
}
