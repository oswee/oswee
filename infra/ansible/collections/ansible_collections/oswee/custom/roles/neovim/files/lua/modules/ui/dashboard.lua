local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.dashboard-nvim] Packer not found")
	return
end

packer.use({
	"glepnir/dashboard-nvim",
	disable = true,
	opt = false,
	requires = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("dashboard").custom_center = {
			-- {
			-- 	icon = "  ",
			-- 	desc = "Recently laset session                  ",
			-- 	shortcut = "SPC s l",
			-- 	action = "SessionLoad",
			-- },
			{
				icon = "  ",
				desc = "Recent files                            ",
				action = "Telescope oldfiles",
				shortcut = "SPC f h",
			},
			{
				icon = "  ",
				desc = "Find  Files                             ",
				action = "Telescope find_files find_command=rg,--hidden,--files",
				shortcut = "SPC f f",
			},
			{
				icon = "  ",
				desc = "Find Word                               ",
				action = "Telescope live_grep",
				shortcut = "SPC f b",
			},
			{
				icon = "  ",
				desc = "File Browser                            ",
				action = "Telescope file_browser",
				shortcut = "SPC f b",
			},
			{
				icon = "  ",
				desc = "Marks                                   ",
				action = "DashboardFindWord",
				shortcut = "SPC f w",
			},
			{
				icon = "  ",
				desc = "Nvim Config                             ",
				action = "edit ~/.config/nvim/init.lua",
				shortcut = "SPC f c",
			},
		}
	end,
})

-- vim.g.dashboard_custom_section = {
-- 	a = { description = { "  Restore last session" }, command = "SessionLoad" },
-- 	-- b = {description = {'  Recent projects     '}, command = 'Telescope projects'},
-- 	c = { description = { "  Recent files        " }, command = "Telescope oldfiles" },
-- 	d = { description = { "  Find file           " }, command = "Telescope find_files" },
-- 	e = { description = { "  Find word           " }, command = "Telescope live_grep" },
-- 	f = { description = { "  Marks               " }, command = "Telescope marks" },
-- 	g = { description = { "  Nvim Config         " }, command = "edit ~/.config/nvim/init.lua" },
-- }

-- vim.g.dashboard_custom_footer = {}
