local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.netrw] Packer not found")
	return
end

vim.g.netrw_altv = 1
