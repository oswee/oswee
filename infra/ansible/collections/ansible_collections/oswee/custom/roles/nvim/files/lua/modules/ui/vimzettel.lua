local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.vimzettel] Packer not found")
	return
end

packer.use({
	"michal-h21/vim-zettel",
	disable = true,
	opt = false,
	requires = {
		{ "vimwiki/vimwiki" },
		{ "junegunn/fzf" },
		{ "junegunn/fzf.vim" },
	},
	config = function()
		vim.g.nv_search_paths = "~/zettelkasten"

		-- require("vim-zettel").setup({})
	end,
})
