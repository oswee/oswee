local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[modules.ui.vim-fugitive] Packer not found")
	return
end

packer.use({
	"tpope/vim-fugitive",
	disable = true,
	opt = false,
})
