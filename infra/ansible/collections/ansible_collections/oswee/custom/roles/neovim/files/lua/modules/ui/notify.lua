local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.notify] Packer not found")
	return
end

packer.use({
	"rcarriga/nvim-notify",
	disable = true,
	opt = false,
	requires = { "nvim-telescope/telescope.nvim" },
	config = function()
		vim.notify = require("notify")
	end,
})

--
-- local ok, notify = pcall(require, "notify")
-- if not ok then
-- 	local errmsg = "[UI] `notify` plugin not installed! Please install via your plugin manager."
-- 	vim.api.nvim_err_writeln(errmsg)
-- 	return
-- end
--
