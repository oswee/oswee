-- local ok, _ = pcall(require, 'dashboard-nvim')
-- if (not ok) then return end

-- vim.notify('Dashboard loaded')

vim.g.dashboard_default_executive = "telescope"

-- vim.g.dashboard_custom_header = {}
vim.g.dashboard_custom_section = {
	a = { description = { "  Restore last session" }, command = "SessionLoad" },
	-- b = {description = {'  Recent projects     '}, command = 'Telescope projects'},
	c = { description = { "  Recent files        " }, command = "Telescope oldfiles" },
	d = { description = { "  Find file           " }, command = "Telescope find_files" },
	e = { description = { "  Find word           " }, command = "Telescope live_grep" },
	f = { description = { "  Marks               " }, command = "Telescope marks" },
	g = { description = { "  Nvim Config         " }, command = "edit ~/.config/nvim/init.lua" },
}
-- vim.g.dashboard_custom_footer = {}
