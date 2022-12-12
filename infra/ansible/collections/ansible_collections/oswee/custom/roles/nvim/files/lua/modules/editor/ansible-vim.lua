local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.ansible-vim] Packer not found")
	return
end

packer.use({
	"pearofducks/ansible-vim",
	disable = true,
	opt = false,
})
