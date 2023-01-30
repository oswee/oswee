local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.nvim-nu] Packer not found")
	return
end

packer.use({
	"LhKipp/nvim-nu",
	disable = false,
	opt = false,
	run = ":TSInstall nu",
	config = function()
		require("nu").setup({
			complete_cmd_names = true,
		})
	end,
})
