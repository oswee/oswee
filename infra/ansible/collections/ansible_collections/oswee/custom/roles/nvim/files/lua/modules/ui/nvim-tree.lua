local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[UI:nvim-tree] Packer is not installed.")
	return
end

packer.use({
	"kyazdani42/nvim-tree.lua",
	disable = false,
	opt = false,
	requires = { "kyazdani42/nvim-web-devicons" },
	wants = "nvim-web-devicons",
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 40,
				mappings = {
					custom_only = false,
				},
			},
			actions = {
				remove_file = {
					close_window = true,
				},
			},
		})

		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "nvim-tree | Toggle" })
		vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>", { desc = "nvim-tree | Refresh" })
		vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<cr>", { desc = "nvim-tree | Find File" })
	end,
})
