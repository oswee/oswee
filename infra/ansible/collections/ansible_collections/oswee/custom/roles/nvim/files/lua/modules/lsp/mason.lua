local packer_installed, packer = pcall(require, 'packer')
if not packer_installed then
	vim.api.nvim_err_writeln('[modules.lsp.mason] Packer not found')
	return
end

packer.use({
	'williamboman/mason.nvim',
	disable = true,
	opt = false,
	config = function()
		require('mason').setup({
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		})
	end,
})
