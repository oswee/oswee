local lc = require("helpers.common").loadConfig

local Dap = {}

function Dap.config()
	return {
		"mfussenegger/nvim-dap",
		opt = true,
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
		config = lc(require("modules.dap.config")),
	}
end

-- function Dap.go()
-- 	return {
-- 		"leoluz/nvim-dap-go",
-- 		-- requires = {
-- 		-- 	{ "nvim-lua/plenary.nvim" },
-- 		-- },
-- 		-- config = lc(require("modules.dap.null-ls")),
-- 	}
-- end
--
-- function Dap.ui()
-- 	return {
-- 		"rcarriga/nvim-dap-ui",
-- 		-- requires = {
-- 		-- 	{ "nvim-lua/plenary.nvim" },
-- 		-- },
-- 		-- config = lc(require("modules.dap.null-ls")),
-- 	}
-- end
--
-- function Dap.virtual_text()
-- 	return {
-- 		"theHamsta/nvim-dap-virtual-text",
-- 		-- requires = {
-- 		-- 	{ "nvim-lua/plenary.nvim" },
-- 		-- },
-- 		-- config = lc(require("modules.dap.null-ls")),
-- 	}
-- end
--
-- function Dap.telescope_dap()
-- 	return {
-- 		"nvim-telescope/telescope-dap.nvim",
-- 		-- requires = {
-- 		-- 	{ "nvim-lua/plenary.nvim" },
-- 		-- },
-- 		-- config = lc(require("modules.dap.null-ls")),
-- 	}
-- end

return Dap
