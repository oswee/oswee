return {
	'nvim-tree/nvim-tree.lua',
	enabled = true,
	version = 'nightly',
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
	config = function()
		local plugin = require('nvim-tree')

		plugin.setup({
			view = {
				width = 40,
			},
			git = {
				ignore = false,
			},
		})

		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "nvim-tree | Toggle" })
		vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>", { desc = "nvim-tree | Refresh" })
		vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<cr>", { desc = "nvim-tree | Find File" })
	end,
}
