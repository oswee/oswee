local ok, packer = pcall(require, "packer")
if not ok then
	vim.api.nvim_err_writeln("[UI:oxocarbon] Packer is not installed")
	return
end

packer.use({
	"shaunsingh/oxocarbon.nvim",
	disable = true,
	opt = false,
	run = "./install.sh",
	config = function()
		vim.opt.background = "light" -- dark | light
		vim.cmd.colorscheme("oxocarbon")
	end,
})
