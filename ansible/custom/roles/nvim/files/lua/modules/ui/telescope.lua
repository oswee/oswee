local ok, telescope = pcall(require, "telescope")
if not ok then
	local errmsg = "[UI] `telescope` plugin not installed! Please install via your plugin manager."
	vim.api.nvim_err_writeln(errmsg)
	return
end

local builtin = require("telescope.builtin")

telescope.load_extension("fzy_native")
telescope.load_extension("zoxide")
-- telescope.load_extension("media_files")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		-- media_files = {
		-- 	-- filetypes whitelist
		-- 	-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
		-- 	filetypes = { "png", "webp", "jpg", "jpeg" },
		-- 	find_cmd = "rg", -- find command (defaults to `fd`)
		-- },
	},
})
