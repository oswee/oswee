local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.telescope] Packer not found")
	return
end

packer.use({
	"nvim-telescope/telescope.nvim",
	disable = false,
	opt = false,
	requires = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-media-files.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
	config = function()
		local telescope_installed, telescope = pcall(require, "telescope")
		if not telescope_installed then
			vim.api.nvim_err_writeln("[modules.ui.telescope] Telescope not found")
			return
		end

		local builtin = require("telescope.builtin")

		telescope.load_extension("fzy_native")
		telescope.load_extension("zoxide")
		telescope.load_extension("file_browser")
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
				-- file_browser = {
				-- 	theme = "ivy",
				-- 	-- disables netrw and use telescope-file-browser in its place
				-- 	hijack_netrw = true,
				-- 	mappings = {
				-- 		["i"] = {
				-- 			-- your custom insert mode mappings
				-- 		},
				-- 		["n"] = {
				-- 			-- your custom normal mode mappings
				-- 		},
				-- 	},
				-- },
				-- media_files = {
				-- 	-- filetypes whitelist
				-- 	-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				-- 	filetypes = { "png", "webp", "jpg", "jpeg" },
				-- 	find_cmd = "rg", -- find command (defaults to `fd`)
				-- },
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "telescope | Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "telescope | Live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "telescope | Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "telescope | Find help" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "telescope | Find keymaps" })
		vim.keymap.set(
			"n",
			"<leader>fd",
			"<cmd>lua require'telescope'.extensions.zoxide.list{}<cr>",
			{ silent = true, noremap = true, desc = "telescope | Zoxide list" }
		)
	end,
})
