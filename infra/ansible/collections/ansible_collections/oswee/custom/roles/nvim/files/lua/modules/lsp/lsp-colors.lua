local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.lsp-colors] Packer not found")
	return
end

packer.use({
	"folke/lsp-colors.nvim",
	disable = false,
	opt = false,
	config = function()
		require("lsp-colors").setup({
			Error = "#db4b4b",
			Warning = "#e0af68",
			Information = "#0db9d7",
			Hint = "#10B981",
		})
	end,
})
