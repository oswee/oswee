local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.vim-css-color] Packer not found")
	return
end

packer.use({
	"ap/vim-css-color",
	disable = false,
	opt = false,
	ft = { "css", "scss", "yaml", "svg", "html", "text", "lua", "cpp", "vim", "scss", "sass" },
})
