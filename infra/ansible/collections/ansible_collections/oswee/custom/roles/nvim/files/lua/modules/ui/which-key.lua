local ok, whichkey = pcall(require, "which-key")
if not ok then
	local errmsg = "[UI] `which-key` plugin not installed! Please install via your plugin manager."
	vim.api.nvim_err_writeln(errmsg)
	return
end

whichkey.setup()

local nav = {
	["<up>"] = { "<C-w><up>", "Move to the upper split" },
	["<down>"] = { "<C-w><down>", "Move to the bottom split" },
	["<left>"] = { "<C-w><left>", "Move to the left split" },
	["<right>"] = { "<C-w><right>", "Move to the right split" },
	K = { "<cmd>Lspsaga hover_doc<CR>", "Saga hover doc" },
}
-- Normal mode keymaps
local keymaps = {
	c = {
		name = "+completion",
		s = { "<cmd>source ~/.config/nvim/plugin/luasnip.lua<CR>", "LuaSnip source" },
	},
	z = {
		name = "+notes",
		n = { "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "" },
		o = { "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "" },
		t = { "<Cmd>ZkTags<CR>", "" },
		f = { "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>", "" },
		m = { "<Cmd>'<,'>ZkMatch<CR>", "" },
	},
	f = {
		name = "+telescope",
		f = { "<Cmd>Telescope find_files<CR>", "Find Files" },
		g = { "<Cmd>Telescope live_grep<CR>", "Live Grep" },
		b = { "<Cmd>Telescope buffers<CR>", "Buffers" },
		h = { "<Cmd>Telescope help_tags<CR>", "Help" },
		d = { "<Cmd>lua require'telescope'.extensions.zoxide.list{}<CR>", "Zoxide list" },
	},
	g = {
		name = "+git",
		g = { "<Cmd>LazyGit<CR>", "Open LazyGit" },
	},
	l = {
		-- TODO: This kind of feels bad because there is no any LSP feature detection
		-- All mappings are global no matter what.
		-- Ideally i would like to have only enabled feature mappings active.
		name = "+lsp",
		f = { "<cmd>Lspsaga lsp_finder<CR>", "Definition and references" },
		a = { "<cmd>Lspsaga code_action<CR>", "Code action" },
		i = { "<cmd>Lspsaga implement<CR>", "Implement" },
		l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics" },
		c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor diagnostics" },
		d = { "<cmd>Lspsaga preview_definition<CR>", "Preview definition" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostics jump next" },
		p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Diagnostics jump previous" },
		s = { "<cmd>Lspsaga signature_help<CR>", "Signature help" },
		r = { "<cmd>Lspsaga rename<CR>", "Rename" },
		j = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "Scroll hover doc" },
		k = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", "Scroll hover doc" },
		t = { "<cmd>Lspsaga toggle_virtual_text<CR>", "Toggle virtual text" },
		y = { "<cmd>Lspsaga yank_line_diagnostics<CR>", "Yank line diagnostics" },
	},
}

local vkey = {
	c = {
		a = { "<cmd>Lspsaga range_code_action<CR>", "Range code action" },
	},
}

-- Telescope
-- vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
-- vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
-- vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
-- vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>")
-- vim.keymap.set("n", "<Leader>cd", "<Cmd>lua require'telescope'.extensions.zoxide.list{}<CR>")

-- -- ZK
-- vim.keymap.set("n", "<Leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>")
-- Open notes.
-- vim.keymap.set("n", "<Leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>")
-- Open notes associated with the selected tags.
-- vim.keymap.set("n", "<Leader>zt", "<Cmd>ZkTags<CR>")
-- Search for the notes matching a given query.
-- vim.keymap.set("n", "<Leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>")
-- Search for the notes matching the current visual selection.
-- vim.keymap.set("v", "<Leader>zm", "<Cmd>'<,'>ZkMatch<CR>")

whichkey.register(nav, {
	mode = "n",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})

-- Normal mode keymaps
whichkey.register(keymaps, {
	mode = "n",
	prefix = "<Leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})

whichkey.register(vkey, {
	mode = "x",
	prefix = "<Leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})
