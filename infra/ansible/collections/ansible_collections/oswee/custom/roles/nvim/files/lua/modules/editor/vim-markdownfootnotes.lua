local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.vim-markdownfootnotes] Packer not found")
	return
end

packer.use({
	"vim-pandoc/vim-markdownfootnotes",
	disable = false,
	opt = false,
})
