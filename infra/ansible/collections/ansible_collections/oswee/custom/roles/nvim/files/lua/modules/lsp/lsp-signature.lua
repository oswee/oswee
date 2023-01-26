local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.lsp-signature] Packer not found")
	return
end

packer.use({
	"ray-x/lsp_signature.nvim",
	disable = false,
	opt = false,
	config = function()
		require("lsp_signature").setup({})
		-- require("lsp_signature").on_attach({})
	end,
})
