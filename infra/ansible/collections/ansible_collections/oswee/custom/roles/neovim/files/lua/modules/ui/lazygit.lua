local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[UI:lazygit] Packer is not installed")
	return
end

packer.use({
	"kdheepak/lazygit.nvim",
	disable = false,
	opt = false,
	config = function()
		vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "lazygit | Open LazyGit" })
	end,
})
