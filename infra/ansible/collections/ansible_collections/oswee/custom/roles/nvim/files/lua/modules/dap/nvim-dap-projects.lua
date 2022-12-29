local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.dap.nvim-dap-projects] Packer not found")
	return
end

packer.use({
	"ldelossa/nvim-dap-projects",
	config = function()
		-- require("nvim-dap-projects").config_paths = { "./test/nvim-dap.lua" }
		require("nvim-dap-projects").search_project_config()
	end,
})
