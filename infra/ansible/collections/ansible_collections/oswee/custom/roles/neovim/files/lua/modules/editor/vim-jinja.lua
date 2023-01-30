local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.vim-jinja] Packer not found")
	return
end

packer.use({
	"lepture/vim-jinja",
	disable = false,
	opt = false,
})
