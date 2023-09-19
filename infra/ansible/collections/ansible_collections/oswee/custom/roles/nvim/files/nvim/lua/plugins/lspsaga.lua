return {
	'nvimdev/lspsaga.nvim',
	enabled = true,
	lazy = false,
	event = 'BufRead',
	dependencies = {
		'neovim/nvim-lspconfig',
		'nvim-treesitter/nvim-treesitter',
		-- 'nvim-tree/nvim-web-devicons'
	},
	config = function()
		local plugin = require('lspsaga')

		plugin.setup({
			-- symbol_in_winbar = {
			-- 	in_custom = true,
			-- },
			-- diagnostic_header = { " ", " ", " ", "ﴞ " },
			ui = {
				code_action = " ",
			},
		})
	end,
	keys = {
		vim.keymap.set('n', '<leader>li', '<cmd>Lspsaga implement<cr>', { silent = true, desc = 'lspsaga | Implement' }),

		vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true, desc = 'lspsaga | Hover doc' }),

		vim.keymap.set(
			'x',
			'<leader>ca',
			'<cmd>Lspsaga range_code_action<cr>',
			{ silent = true, desc = 'lspsaga | Range code action' }
		),

		vim.keymap.set(
			'n',
			'<leader>lj',
			'<cmd>Lspsaga smart_scroll_with_saga(1)<cr>',
			{ silent = true, desc = 'lspsaga | Scroll hover doc next' }
		),

		vim.keymap.set(
			'n',
			'<leader>lk',
			'<cmd>Lspsaga smart_scroll_with_saga(-1)<cr>',
			{ silent = true, desc = 'lspsaga | Scroll hover doc back' }
		),

		vim.keymap.set(
			'n',
			'<leader>lt',
			'<cmd>Lspsaga toggle_virtual_text<cr>',
			{ silent = true, desc = 'lspsaga | Toggle virtual text' }
		),

		vim.keymap.set(
			'n',
			'<C-k',
			'<cmd>Lspsaga signature_help<cr>',
			{ silent = true, desc = 'lspsaga | Signature help' }
		),

		vim.keymap.set(
			'n',
			'gh',
			'<cmd>Lspsaga lsp_finder<cr>',
			{ silent = true, desc = 'lspsaga | Definition and references' }
		),

		vim.keymap.set(
			{ 'n', 'v' },
			'<leader>ca',
			'<cmd>Lspsaga code_action<cr>',
			{ silent = true, desc = 'lspsaga | Code action' }
		),

		vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>', { silent = true, desc = 'lspsaga | Rename' }),

		vim.keymap.set(
			'n',
			'gd',
			'<cmd>Lspsaga peek_definition<cr>',
			{ silent = true, desc = 'lspsaga | Peek definition' }
		),

		vim.keymap.set(
			'n',
			'<leader>cd',
			'<cmd>Lspsaga show_line_diagnostics<cr>',
			{ silent = true, desc = 'lspsaga | Show line diagnostics' }
		),

		vim.keymap.set(
			'n',
			'<leader>cd',
			'<cmd>Lspsaga show_cursor_diagnostics<cr>',
			{ silent = true, desc = 'lspsaga | Show cursor diagnostics' }
		),

		vim.keymap.set(
			'n',
			'[e',
			'<cmd>Lspsaga diagnostic_jump_prev<cr>',
			{ silent = true, desc = 'lspsaga | Diagnostics jump previous' }
		),

		vim.keymap.set(
			'n',
			']e',
			'<cmd>Lspsaga diagnostic_jump_next<cr>',
			{ silent = true, desc = 'lspsaga | Diagnostics jump next' }
		),

		vim.keymap.set('n', '[E', function()
			require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, { silent = true, desc = 'lspsaga | Diagnostics go to previous error' }),

		vim.keymap.set('n', ']E', function()
			require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, { silent = true, desc = 'lspsaga | Diagnostics go to next error' }),

		vim.keymap.set(
			'n',
			'<leader>o',
			'<cmd>Lspsaga outline<cr>',
			{ silent = true, desc = 'lspsaga | Toggle outline' }
		),

		vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true, desc = 'lspsaga | Hover documentation' }),

		vim.keymap.set(
			'n',
			'<leader>ly',
			'<cmd>Lspsaga yank_line_diagnostics<cr>',
			{ silent = true, desc = 'lspsaga | Yank line diagnostics' }
		),

		vim.keymap.set(
			'n',
			'<A-d>',
			'<cmd>Lspsaga open_floaterm<cr>',
			{ silent = true, desc = 'lspsaga | Open floaterm' }
		),

		vim.keymap.set(
			'n',
			'<A-d>',
			'<cmd>Lspsaga open_floaterm lazygit<cr>',
			{ silent = true, desc = 'lspsaga | Open floaterm LazyGit' }
		),

		vim.keymap.set(
			't',
			'<A-d>',
			[[<C-\><C-n><cmd>Lspsaga close_floaterm<cr>]],
			{ silent = true, desc = 'lspsaga | Close floaterm' }
		),
	},
}
