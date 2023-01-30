local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.vim-helm] Packer not found")
	return
end

packer.use({
	"towolf/vim-helm",
	disable = false,
	opt = false,
})
