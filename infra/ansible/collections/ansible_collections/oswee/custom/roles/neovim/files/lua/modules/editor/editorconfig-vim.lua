local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.editorconfig-vim] Packer not found")
	return
end

packer.use({
	"editorconfig/editorconfig-vim",
	disable = false,
	opt = false,
})
