-- local ok_dap, dap = pcall(require, "dap")
-- if not ok_dap then
-- 	local errmsg = "[DAP] `dap` plugin not installed! Please install via your plugin manager."
-- 	vim.api.nvim_err_writeln(errmsg)
-- 	return
-- end
--
-- local dapui_ok, dapui = pcall(require, "dapui")
-- if not dapui_ok then
-- 	local errmsg = "[DAP] `dapui` plugin not installed! Please install via your plugin manager."
-- 	vim.api.nvim_err_writeln(errmsg)
-- 	return
-- end

local M = {}

local function configure()
	local dap_breakpoint = {
		error = {
			text = "🟥",
			texthl = "LspDiagnosticsSignError",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "",
			texthl = "LspDiagnosticsSignHint",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "⭐️",
			texthl = "LspDiagnosticsSignInformation",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticsSignInformation",
		},
	}

	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
	require("nvim-dap-virtual-text").setup({
		commented = true,
	})
	local dap, dapui = require("dap"), require("dapui")
	dapui.setup({}) -- use default
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local function configure_debuggers()
	require("modules.dap.lua").setup()
	-- require("modules.dap.rust").setup()
	require("modules.dap.go").setup()
end

function M.setup()
	configure() -- Configuration
	configure_exts() -- Extensions
	configure_debuggers() -- Debugger
	require("modules.dap.keymaps").setup() -- Keymaps
end

configure_debuggers()

return M
