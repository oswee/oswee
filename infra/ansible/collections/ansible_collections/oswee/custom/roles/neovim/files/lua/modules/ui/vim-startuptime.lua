local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.vim-startuptime] Packer not found")
	return
end

packer.use({
	"dstein64/vim-startuptime",
	disable = false,
	opt = true,
	cmd = "StartupTime",
})
