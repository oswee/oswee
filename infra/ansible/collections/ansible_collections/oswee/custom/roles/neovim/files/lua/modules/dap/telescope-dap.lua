local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.dap.telescope-dap] Packer not found")
	return
end

packer.use({
	"nvim-telescope/telescope-dap.nvim",
	disable = false,
	opt = true,
	-- requires = {
	-- 	{ "nvim-lua/plenary.nvim" },
	-- },
	-- config = lc(require("modules.dap.null-ls")),
})
