local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.vim-hexokinase] Packer not found")
	return
end

packer.use({
	"rrethy/vim-hexokinase",
	disable = false,
	opt = false,
	run = "make hexokinase",
	config = function()
		vim.g.Hexokinase_ftEnabled = { "css", "scss", "svg", "html", "javascript" }
	end,
})
