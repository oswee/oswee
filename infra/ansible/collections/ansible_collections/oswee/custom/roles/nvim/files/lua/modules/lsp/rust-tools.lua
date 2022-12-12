local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.rust-tools] Packer not found")
	return
end

packer.use({
	"simrat39/rust-tools.nvim",
	disable = true,
	opt = false,
})
