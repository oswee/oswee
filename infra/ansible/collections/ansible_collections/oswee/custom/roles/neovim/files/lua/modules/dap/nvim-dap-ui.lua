local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.dap.nvim-dap-ui] Packer not found")
	return
end

packer.use({
	"rcarriga/nvim-dap-ui",
	disable = false,
	opt = false,
	requires = { "mfussenegger/nvim-dap" },
	config = function()
		-- require("dapui").setup({})

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.after.event_initialized["dapui_config"] = function()
			-- You can do any fancy things there, like some custom keymaps, windows. Etc.
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set(
			"n",
			"<leader>E",
			"<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",
			{ desc = "nvim-dap-ui | Evaluate input" }
		)
		vim.keymap.set("n", "<leader>U", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "nvim-dap-ui | Toggle UI" })
		vim.keymap.set("n", "<leader>e", "<cmd>lua require'dapui'.eval()<cr>", { desc = "nvim-dap-ui | Evaluate" })
	end,
})
