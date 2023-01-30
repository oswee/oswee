local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.gruvbox] Packer not found")
	return
end

packer.use({
	"ellisonleao/gruvbox.nvim",
	disable = false,
	opt = false,
	requires = { "rktjmp/lush.nvim" },
	config = function()
		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = true,
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})

		vim.opt.background = "light" -- dark | light
		vim.cmd([[colorscheme gruvbox]])
	end,
})
