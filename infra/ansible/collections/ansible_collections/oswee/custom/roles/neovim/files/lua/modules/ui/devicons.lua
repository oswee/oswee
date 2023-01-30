local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.devicons] Packer not found")
	return
end

packer.use({
	"kyazdani42/nvim-web-devicons",
	disable = false,
	opt = false,
	config = function()
		require("nvim-web-devicons").setup({})
	end,
})
