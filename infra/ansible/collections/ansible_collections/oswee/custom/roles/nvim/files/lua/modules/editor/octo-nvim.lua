local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.octo-nvim] Packer not found")
	return
end

packer.use({
	"pwntester/octo.nvim",
	disable = true,
	opt = false,
	requires = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "kyazdani42/nvim-web-devicons" },
	},
})
