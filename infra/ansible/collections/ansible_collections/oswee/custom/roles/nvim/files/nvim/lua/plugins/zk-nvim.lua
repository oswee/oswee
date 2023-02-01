return {
	'mickael-menu/zk-nvim',
	enabled = true,
	lazy = false,
	dependencies = {
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		local plugin = require('zk')

		plugin.setup({
			picker = 'telescope',

			lsp = {
				config = {
					-- cmd = { "zk", "lsp", "--log", "/tmp/zk-lsp.log" },
					cmd = { 'zk', 'lsp' },
					name = 'zk',
				},

				auto_attach = {
					enabled = true,
					filetypes = { 'markdown' },
				},
			},
		})

		local function make_new_fn(defaults)
			return function(options)
				options = vim.tbl_extend('force', defaults, options or {})
				require('zk').new(options)
			end
		end

		-- local function make_edit_fn(defaults, picker_options)
		-- 	return function(options)
		-- 		options = vim.tbl_extend("force", defaults, options or {})
		-- 		require("zk").edit(options, picker_options)
		-- 	end
		-- end
		--
		-- Create your own custom zk commands for :ZkYourCommand
		-- commands.add("ZkDailiesx", make_edit_fn({ tags = { "idea" }, sort = { "created" } }, { title = "Zk Daily Notes" }))

		-- commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))

		-- commands.add(
		-- 	"ZkRecents",
		-- 	make_edit_fn({ modifiedAfter = "4 weeks ago", sort = { "modified" } }, { title = "Zk Recents" })
		-- )

		-- commands.add("ZkTodayx", function()
		-- 	local timestamp = os.time(os.date("*t"))
		-- 	local day_before = os.date("%Y-%m-%d", timestamp - 86400)
		-- 	local day_after = os.date("%Y-%m-%d", timestamp + 86400)
		--
		-- 	zk.new({ group = "daily", dir = "Daily", extra = { yesterday = day_before, tomorrow = day_after } })
		-- end)

		-- commands.add("ZkTodayy", function()
		-- 	local timestamp = os.time(os.date("*t"))
		--
		-- 	zk.new({ group = "daily", dir = "Daily" })
		-- end)

		require('zk.commands').add('ZkNewFleeting', make_new_fn({ dir = 'base/memex' }))
		require('zk.commands').add('ZkNewDaily', make_new_fn({ group = 'daily', dir = 'base/daily' }))
		require('zk.commands').add('ZkNewZettel', make_new_fn({ group = 'zettel', dir = 'base/memex' }))
		require('zk.commands').add('ZkNewLiterature', make_new_fn({ group = 'literature', dir = 'base/memex' }))
		require('zk.commands').add('ZkNewIndex', make_new_fn({ group = 'index', dir = 'base/memex' }))
		require('zk.commands').add('ZkNewFromTitleSelection', make_new_fn({ dir = vim.fn.expand('%:p:h') }))
		require('zk.commands').add('ZkNewFromContentSelection', make_new_fn({ dir = vim.fn.expand('%:p:h') }))

		vim.keymap.set(
			'n',
			'<leader>zn',
			"<cmd>ZkNewFleeting { title = vim.fn.input('Fleeting Title: ')}<cr>",
			{ desc = 'zk-nvim | New fleeting note' }
		)
		vim.keymap.set(
			'n',
			'<leader>ln',
			"<cmd>ZkNewLiterature { title = vim.fn.input('Literature Title: ')}<cr>",
			{ desc = 'zk-nvim | New literature note' }
		)
		vim.keymap.set(
			'n',
			'<leader>zz',
			"<cmd>ZkNewZettel { title = vim.fn.input('Zettel Title: ') }<cr>",
			{ desc = 'zk-nvim | New zettel note' }
		)
		vim.keymap.set(
			'n',
			'<leader>in',
			"<cmd>ZkNewIndex { title = vim.fn.input('Index Title: ') }<cr>",
			{ desc = 'zk-nvim | New index note' }
		)
		-- vim.keymap.set("n", "<leader>zc", "<cmd>ZkCd<cr>", { desc = "zk-nvim | CD into notebook root" })
		-- vim.keymap.set("n", "<leader>zi", "<cmd>ZkIndex<cr>", { desc = "zk-nvim | Index the notebook" })
		vim.keymap.set('n', '<leader>zb', '<cmd>ZkBackLinks<cr>', { desc = 'zk-nvim | Open backlinks' })
		vim.keymap.set('n', '<leader>zd', '<cmd>ZkNewDaily<cr>', { desc = 'zk-nvim | New daily note' })
		vim.keymap.set('n', '<leader>zo', "<cmd>ZkNotes { sort = {'modified'}}<cr>", { desc = 'zk-nvim | Open notes' })
		vim.keymap.set('n', '<leader>zt', '<cmd>ZkTags<cr>', { desc = 'zk-nvim | Filter notes by tag' })
		vim.keymap.set('n', '<leader>zm', "<cmd>'<,'>ZkMatch<cr>", { desc = 'zk-nvim | Search by last visual selection' })
		vim.keymap.set('v', '<leader>zm', "<cmd>'<,'>ZkMatch<cr>", { desc = 'zk-nvim | Search by last visual selection' })

		-- Open the link under the caret.
		vim.keymap.set(
			'n',
			'<cr>',
			'<cmd>lua vim.lsp.buf.definition()<cr>',
			{ desc = 'zk-nvim | Open the link under the caret' }
		)

		-- Create a new note in the same directory as the current buffer, using the current selection for title.
		vim.keymap.set(
			'v',
			'<leader>zS',
			"<cmd>'<,'>ZkNewFromTitleSelection<cr>",
			{ desc = 'zk-nvim | New note from selection' }
		)

		-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
		vim.keymap.set(
			'v',
			'<leader>zs',
			"<cmd>'<,'>ZkNewFromContentSelection { title = vim.fn.input('Title: ') }<cr>",
			{ desc = 'zk-nvim | New note from selection with title' }
		)

		-- Alternative for backlinks using pure LSP and showing the source context.
		vim.keymap.set('n', '<leader>zb', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'zk-nvim | Open backlinks' })

		-- Open notes linked by the current buffer.
		vim.keymap.set('n', '<leader>zl', '<cmd>ZkLinks<cr>', { desc = 'zk-nvim | Open linked notes' })

		-- Open the code actions for a visual selection. (It's the same as general `<leader>ca` LSP keymap)
		-- vim.keymap.set(
		-- 	"v",
		-- 	"<leader>za",
		-- 	"<cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>",
		-- 	{ desc = "zk-nvim | Code actions" }
		-- )
	end,
}
