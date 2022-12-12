local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.dap.nvim-dap-virtual-text] Packer not found")
	return
end

packer.use({
	"theHamsta/nvim-dap-virtual-text",
	disable = false,
	opt = false,
	config = function()
		require("nvim-dap-virtual-text").setup({
			commented = true,
		})
	end,
})
