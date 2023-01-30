local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.lsp-status] Packer not found")
	return
end

packer.use({
	"nvim-lua/lsp-status.nvim",
	disable = true,
	opt = false,
})
