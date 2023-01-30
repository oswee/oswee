local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.lsp.lspsaga-nvim] Packer not found")
	return
end

packer.use({
	"glepnir/lspsaga.nvim",
	disable = false,
	opt = false,
	requires = { "neovim/nvim-lspconfig" },
	config = function()
		local lspsaga = require("lspsaga")
		lspsaga.init_lsp_saga({
			border_style = "single",
			saga_winblend = 0,
			move_in_saga = { prev = "<C-p>", next = "<C-n>" },
			diagnostic_header = { " ", " ", " ", "ﴞ " },
			preview_lines_above = 0,
			max_preview_lines = 10,
			code_action_icon = " ",
			code_action_num_shortcut = true,
			code_action_lightbulb = {
				enable = true,
				enable_in_insert = true,
				cache_code_action = true,
				sign = true,
				icon = " ",
				update_time = 150,
				sign_priority = 20,
				virtual_text = true,
			},
			finder_icons = {
				def = "  ",
				ref = "諭 ",
				link = "  ",
			},
			finder_request_timeout = 1500,
			finder_action_keys = {
				open = { "o", "<CR>" },
				vsplit = "s",
				split = "i",
				tabe = "t",
				quit = { "q", "<ESC>" },
			},
			code_action_keys = {
				quit = "q",
				exec = "<CR>",
			},
			definition_action_keys = {
				edit = "<C-c>o",
				vsplit = "<C-c>v",
				split = "<C-c>i",
				tabe = "<C-c>t",
				quit = "q",
			},
			rename_action_quit = "<C-c>",
			rename_in_select = true,
			symbol_in_winbar = {
				in_custom = false,
				enable = true,
				separator = " ",
				show_file = true,
				file_formatter = "",
				click_support = false,
			},
			show_outline = {
				win_position = "right",
				win_with = "",
				win_width = 30,
				auto_enter = true,
				auto_preview = true,
				virt_text = "┃",
				jump_key = "o",
				auto_refresh = true,
			},
			custom_kind = {},
			server_filetype_map = {},

			vim.keymap.set(
				"n",
				"<leader>li",
				"<cmd>Lspsaga implement<cr>",
				{ silent = true, desc = "lspsaga | Implement" }
			),

			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, desc = "lspsaga | Hover doc" }),

			vim.keymap.set(
				"x",
				"<leader>ca",
				"<cmd>Lspsaga range_code_action<cr>",
				{ silent = true, desc = "lspsaga | Range code action" }
			),

			vim.keymap.set(
				"n",
				"<leader>lj",
				"<cmd>Lspsaga smart_scroll_with_saga(1)<cr>",
				{ silent = true, desc = "lspsaga | Scroll hover doc next" }
			),

			vim.keymap.set(
				"n",
				"<leader>lk",
				"<cmd>Lspsaga smart_scroll_with_saga(-1)<cr>",
				{ silent = true, desc = "lspsaga | Scroll hover doc back" }
			),

			vim.keymap.set(
				"n",
				"<leader>lt",
				"<cmd>Lspsaga toggle_virtual_text<cr>",
				{ silent = true, desc = "lspsaga | Toggle virtual text" }
			),

			vim.keymap.set(
				"n",
				"<C-k",
				"<cmd>Lspsaga signature_help<cr>",
				{ silent = true, desc = "lspsaga | Signature help" }
			),

			vim.keymap.set(
				"n",
				"gh",
				"<cmd>Lspsaga lsp_finder<cr>",
				{ silent = true, desc = "lspsaga | Definition and references" }
			),

			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				"<cmd>Lspsaga code_action<cr>",
				{ silent = true, desc = "lspsaga | Code action" }
			),

			vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", { silent = true, desc = "lspsaga | Rename" }),

			vim.keymap.set(
				"n",
				"gd",
				"<cmd>Lspsaga peek_definition<cr>",
				{ silent = true, desc = "lspsaga | Peek definition" }
			),

			vim.keymap.set(
				"n",
				"<leader>cd",
				"<cmd>Lspsaga show_line_diagnostics<cr>",
				{ silent = true, desc = "lspsaga | Show line diagnostics" }
			),

			vim.keymap.set(
				"n",
				"<leader>cd",
				"<cmd>Lspsaga show_cursor_diagnostics<cr>",
				{ silent = true, desc = "lspsaga | Show cursor diagnostics" }
			),

			vim.keymap.set(
				"n",
				"[e",
				"<cmd>Lspsaga diagnostic_jump_prev<cr>",
				{ silent = true, desc = "lspsaga | Diagnostics jump previous" }
			),

			vim.keymap.set(
				"n",
				"]e",
				"<cmd>Lspsaga diagnostic_jump_next<cr>",
				{ silent = true, desc = "lspsaga | Diagnostics jump next" }
			),

			vim.keymap.set("n", "[E", function()
				require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true, desc = "lspsaga | Diagnostics go to previous error" }),

			vim.keymap.set("n", "]E", function()
				require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true, desc = "lspsaga | Diagnostics go to next error" }),

			vim.keymap.set(
				"n",
				"<leader>o",
				"<cmd>LSoutlineToggle<cr>",
				{ silent = true, desc = "lspsaga | Toggle outline" }
			),

			vim.keymap.set(
				"n",
				"K",
				"<cmd>Lspsaga hover_doc<cr>",
				{ silent = true, desc = "lspsaga | Hover documentation" }
			),

			vim.keymap.set(
				"n",
				"<leader>ly",
				"<cmd>Lspsaga yank_line_diagnostics<cr>",
				{ silent = true, desc = "lspsaga | Yank line diagnostics" }
			),

			vim.keymap.set(
				"n",
				"<A-d",
				"<cmd>Lspsaga open_floaterm<cr>",
				{ silent = true, desc = "lspsaga | Open floaterm" }
			),

			vim.keymap.set(
				"n",
				"<A-d>",
				"<cmd>Lspsaga open_floaterm lazygit<cr>",
				{ silent = true, desc = "lspsaga | Open floaterm LazyGit" }
			),

			vim.keymap.set(
				"t",
				"<A-d>",
				[[<C-\><C-n><cmd>Lspsaga close_floaterm<cr>]],
				{ silent = true, desc = "lspsaga | Close floaterm" }
			),

			----------
		})
	end,
})
