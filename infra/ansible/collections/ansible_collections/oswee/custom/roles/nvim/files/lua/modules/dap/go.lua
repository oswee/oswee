local M = {}

function M.setup()
	local ok, dap_go = pcall(require, "dap-go")
	if not ok then
		local errmsg = "[DAP] `dap-go` plugin not installed! Please install via your plugin manager."
		vim.api.nvim_err_writeln(errmsg)
		return
	end

	dap_go.setup()
end

return M
