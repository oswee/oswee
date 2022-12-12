local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.indent-blankline] Packer not found")
	return
end

packer.use({
	"lukas-reineke/indent-blankline.nvim",
	disable = false,
	opt = false,
	config = function()
		require("indent_blankline").setup({
			-- char = '▏',
			char_list = { "|", "¦", "┆", "┊" },
			filetype_exclude = {
				"",
				"dashboard",
				"terminal",
				"help",
				"packer",
				"NvimTree",
				"sagahover",
				"markdown",
				"undotree",
			},
			buftype_exclude = { "terminal" },
			use_treesitter = true,
			show_first_indent_level = false,
			show_trailing_blankline_indent = false,
			show_end_of_line = true,
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
			-- indentLine_setColors = 1,
			context_patterns = {
				"class",
				"function",
				"method",
				"if",
				"table",
				"dictionary",
				"list",
				"parameters",
				"expression_list",
				"for_statement",
			},
		})

		-- vim.opt.list = true
		-- vim.opt.listchars:append('space:⋅')
		-- vim.opt.listchars:append('eol:↴')
		-- vim.g.indent_blankline_enabled = true
	end,
})
