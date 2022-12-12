local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[UI:newpaper] Packer is not installed")
	return
end

packer.use({
	disable = true,
	opt = false,
	"yorik1984/newpaper.nvim",
	config = function()
		require("newpaper").setup({
			style = "light",
		})

		vim.opt.background = "light" -- dark | light
		vim.cmd([[colorscheme newpaper]])
	end,
})
