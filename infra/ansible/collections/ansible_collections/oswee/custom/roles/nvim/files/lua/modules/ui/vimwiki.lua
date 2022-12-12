local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.vimwiki] Packer not found")
	return
end

packer.use({
	"vimwiki/vimwiki",
	disable = true,
	opt = false,
	config = function()
		vim.g.vimwiki_global_ext = 0 -- Disable wimwiki for any other markdown file
		vim.g.vimwiki_list = {
			{
				path = "~/vimwiki",
				syntax = "markdown",
				ext = ".md",
			},
			{
				path = "~/code/github.com/dzintars/infra/docs/",
				syntax = "markdown",
				ext = ".md",
			},
			{
				path = "~/code/github.com/dzintars/agora/",
				syntax = "markdown",
				ext = ".md",
			},
		}
	end,
})
