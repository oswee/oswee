local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.package-info] Packer not found")
	return
end

packer.use({
	"vuki656/package-info.nvim",
	disable = false,
	opt = false,
	requires = "MunifTanjim/nui.nvim",
	config = function()
		require("package-info").setup()

		vim.keymap.set(
			"n",
			"<leader>ps",
			":lua require('package-info').show()<CR>",
			{ silent = true, noremap = true, desc = "package-info | Show package version" }
		)

		vim.keymap.set(
			"n",
			"<leader>pc",
			":lua require('package-info').hide()<CR>",
			{ silent = true, noremap = true, desc = "package-info | Hide package version" }
		)

		vim.keymap.set(
			"n",
			"<leader>pu",
			":lua require('package-info').update()<CR>",
			{ silent = true, noremap = true, desc = "package-info | Update package under cursor" }
		)

		vim.keymap.set(
			"n",
			"<leader>pd",
			":lua require('package-info').delete()<CR>",
			{ silent = true, noremap = true, desc = "package-info | Delete package under cursor" }
		)

		vim.keymap.set(
			"n",
			"<leader>pi",
			":lua require('package-info').install()<CR>",
			{ silent = true, noremap = true, desc = "package-info | Install a new package" }
		)

		vim.keymap.set(
			"n",
			"<leader>pr",
			":lua require('package-info').reinstall()<CR>",
			{ silent = true, noremap = true, desc = "package-info | Reinstall dependencies" }
		)

		vim.keymap.set(
			"n",
			"<leader>pv",
			":lua require('package-info').change_version()<CR>",
			{ silent = true, noremap = true, desc = "package-info | Install a different package version" }
		)
	end,
})
