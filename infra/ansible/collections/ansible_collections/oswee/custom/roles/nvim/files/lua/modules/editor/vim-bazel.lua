local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.vim-bazel] Packer not found")
	return
end

packer.use({
	"bazelbuild/vim-bazel",
	disable = false,
	opt = false,
	requires = {
		"google/vim-maktaba",
	},
})
