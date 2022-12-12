local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[modules.ui.vim-rooter] Packer not found")
	return
end

packer.use({
	"airblade/vim-rooter",
	disable = true,
	opt = false,
})
