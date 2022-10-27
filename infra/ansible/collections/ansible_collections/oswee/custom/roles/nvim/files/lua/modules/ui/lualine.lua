-- local package = require("package-info")
local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

local vim = vim

-- local function lsp_progress()
-- 	local messages = vim.lsp.util.get_progress_messages()
-- 	if #messages == 0 then
-- 		return
-- 	end
-- 	local status = {}
-- 	for _, msg in pairs(messages) do
-- 		table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
-- 	end
-- 	local spinners = {
-- 		"⠋",
-- 		"⠙",
-- 		"⠹",
-- 		"⠸",
-- 		"⠼",
-- 		"⠴",
-- 		"⠦",
-- 		"⠧",
-- 		"⠇",
-- 		"⠏",
-- 	}
-- 	local ms = vim.loop.hrtime() / 1000000
-- 	local frame = math.floor(ms / 120) % #spinners
-- 	return table.concat(status, " | ") .. " " .. spinners[frame + 1]
-- end

-- vim.cmd("autocmd User LspProgressUpdate let &ro = &ro")

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

-- local function package_info()
-- 	return package.get_status()
-- end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'NERDTree', 'Outline' },
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { 'mode' },
		-- lualine_b = { "branch", "diff", "GitStatusCount" },
		-- lualine_b = { { "b:gitsigns_head", icon = "" } },
		lualine_b = { { 'branch', 'diff', source = diff_source } },
		lualine_x = {
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				color_error = '#CC241D',
				symbols = {
					error = ' ',
					warn = ' ',
					info = ' ',
					hint = ' ',
				},
			},
			'encoding',
			'filetype',
			'lsp_progress',
		},
		lualine_y = { 'progress' },
		lualine_z = {
			'location',
			{
				function()
					return vim.fn.search([[\s\+$]], 'nw') ~= 0 and 'trailing' or ''
				end,
				icon = '', -- What ever icon you want
				color = { bg = '#ff5a50' },
			},
			{
				-- function()
				-- 	local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
				-- 	local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
				-- 	local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)
				-- 	return mixed and "mixed-indent" or ""
				-- end,
				function()
					local space_pat = [[\v^ +]]
					local tab_pat = [[\v^\t+]]
					local space_indent = vim.fn.search(space_pat, 'nwc')
					local tab_indent = vim.fn.search(tab_pat, 'nwc')
					local mixed = (space_indent > 0 and tab_indent > 0)
					local mixed_same_line
					if not mixed then
						mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
						mixed = mixed_same_line > 0
					end
					if not mixed then
						return ''
					end
					if mixed_same_line ~= nil and mixed_same_line > 0 then
						return 'MI:' .. mixed_same_line
					end
					local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
					local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
					if space_indent_cnt > tab_indent_cnt then
						return 'MI:' .. tab_indent
					else
						return 'MI:' .. space_indent
					end
				end,
				icon = '',
				color = { bg = '#bb2200' },
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { 'fzf', 'nvim-tree', 'fugitive' },
})
