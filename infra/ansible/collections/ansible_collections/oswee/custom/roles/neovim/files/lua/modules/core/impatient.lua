local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.core.impatient] Packer not found")
	return
end

packer.use({
	"lewis6991/impatient.nvim",
	disable = false,
	opt = false,
	config = function()
		require("impatient")
	end,
})
