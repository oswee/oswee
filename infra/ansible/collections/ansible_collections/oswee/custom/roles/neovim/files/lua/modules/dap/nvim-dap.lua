local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.dap.nvim-dap] Packer not found")
	return
end

packer.use({
	"mfussenegger/nvim-dap",
	disable = false,
	opt = false,
	event = "BufReadPre",
	module = { "dap" },
	wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "which-key.nvim" },
	requires = {
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"nvim-telescope/telescope-dap.nvim",
		{ "leoluz/nvim-dap-go", module = "dap-go" },
		{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
	},
	config = function()
		require("modules.dap.language.lua").setup()
		-- require("modules.dap.language.rust").setup()

		vim.keymap.set(
			"n",
			"<leader>R",
			"<cmd>lua require'dap'.run_to_cursor()<cr>",
			{ desc = "nvim-dap | Run to cursor" }
		)
		vim.keymap.set(
			"n",
			"<leader>B",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Breakpoint condition: ] > ')<cr>",
			{ desc = "nvim-dap | Conditional breakpoint" }
		)
		vim.keymap.set("n", "<leader>c", "<cmd>lua require'dap'.continue()<cr>", { desc = "nvim-dap | Continue" })
		vim.keymap.set("n", "<leader>d", "<cmd>lua require'dap'.disconnect()<cr>", { desc = "nvim-dap | Disconnect" })
		vim.keymap.set("n", "<leader>g", "<cmd>lua require'dap'.session()<cr>", { desc = "nvim-dap | Get session" })
		vim.keymap.set(
			"n",
			"<leader>h",
			"<cmd>lua require'dap.ui.widgets'.hover()<cr>",
			{ desc = "nvim-dap | Hover variables" }
		)
		vim.keymap.set(
			"n",
			"<leader>S",
			"<cmd>lua require'dap.ui.widgets'.scopes()<cr>",
			{ desc = "nvim-dap | Scopes" }
		)
		vim.keymap.set("n", "<leader>i", "<cmd>lua require'dap'.step_into()<cr>", { desc = "nvim-dap | Step into" })
		vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.step_back()<cr>", { desc = "nvim-dap | Step back" })
		vim.keymap.set("n", "<leader>o", "<cmd>lua require'dap'.step_over()<cr>", { desc = "nvim-dap | Step over" })
		vim.keymap.set("n", "<leader>u", "<cmd>lua require'dap'.step_out()<cr>", { desc = "nvim-dap | Step out" })
		vim.keymap.set("n", "<leader>p", "<cmd>lua require'dap'.pause.toggle()<cr>", { desc = "nvim-dap | Pause" })
		vim.keymap.set("n", "<leader>q", "<cmd>lua require'dap'.close()<cr>", { desc = "nvim-dap | Quit" })
		vim.keymap.set("n", "<leader>r", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "nvim-dap | Toggle repl" })
		vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", { desc = "nvim-dap | Repl open" })
		vim.keymap.set(
			"n",
			"<leader>t",
			"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
			{ desc = "nvim-dap | Toggle breakpoint" }
		)
		vim.keymap.set("n", "<leader>x", "<cmd>lua require'dap'.terminate()<cr>", { desc = "nvim-dap | Terminate" })

		vim.keymap.set("v", "<leader>e", "<cmd>lua require'dap'.eval()<cr>", { desc = "nvim-dap | Evaluate" })
		vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "nvim-dap | Run last" })
		vim.keymap.set(
			"n",
			"<leader>lp",
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
			{ desc = "nvim-dap | Set breakpoint" }
		)
	end,
})
