local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.undotree] Packer not found")
	return
end

packer.use({
	"mbbill/undotree",
	disable = false,
	opt = false,
})
