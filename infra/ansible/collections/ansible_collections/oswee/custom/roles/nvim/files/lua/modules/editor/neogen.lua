local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.neogen] Packer not found")
	return
end

packer.use({
	"danymat/neogen",
	disable = true,
	opt = false,
	requires = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("neogen").setup({})
	end,
})
