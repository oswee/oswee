local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[UI:nerdtree] Packer is not installed")
	return
end

packer.use({
	"preservim/nerdtree",
	disable = true,
	opt = false,
	requires = { "kyazdani42/nvim-web-devicons" },
	config = function()
		vim.g.NERDTreeWinPos = "left" -- wheen splitright=false open the file tree in the left side.
		vim.g.NERDTreeMinimalUI = true
		vim.g.NERDTreeShowHidden = true
		vim.g.NERDTreeAutoDeleteBuffer = true
		vim.g.NERDTreeDirArrowExpandable = ""
		vim.g.NERDTreeDirArrowCollapsible = ""
		vim.g.NERDTreeWinSize = 34

		vim.keymap.set("n", "<Leader>n", "<cmd>NERDTreeFocus<cr>", { desc = "nerdtree | Focus" })
		vim.keymap.set("n", "<C-n>", "<cmd>NERDTree<cr>", { desc = "nerdtree | Open" })
		vim.keymap.set("n", "<C-t>", "<cmd>NERDTreeToggle<cr>", { desc = "nerdtree | Toggle" })
		vim.keymap.set("n", "<C-f>", "<cmd>NERDTreeFind<cr>", { desc = "nerdtree | Find" })
	end,
})
