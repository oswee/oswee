local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.dap.nvim-dap-go] Packer not found")
	return
end

packer.use({
	"leoluz/nvim-dap-go",
	disable = false,
	opt = false,
	config = function()
		require("dap-go").setup()
	end,
})
