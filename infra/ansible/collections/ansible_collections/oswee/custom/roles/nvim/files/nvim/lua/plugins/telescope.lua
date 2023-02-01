return {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	lazy = false,
	dependencies = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-media-files.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
	config = function()
		local plugin = require("telescope")

		local builtin = require("telescope.builtin")

		plugin.load_extension("fzy_native")
		plugin.load_extension("zoxide")
		plugin.load_extension("file_browser")

		plugin.setup({})
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
}
