local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.which-key] Packer not found")
	return
end

packer.use({
	"folke/which-key.nvim",
	disable = false,
	opt = false,
	config = function()
		require("which-key").setup()

		local nav = {
			["<up>"] = { "<C-w><up>", "Move to the upper split" },
			["<down>"] = { "<C-w><down>", "Move to the bottom split" },
			["<left>"] = { "<C-w><left>", "Move to the left split" },
			["<right>"] = { "<C-w><right>", "Move to the right split" },
		}

		require("which-key").register(nav, {
			mode = "n",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = false,
		})
	end,
})
