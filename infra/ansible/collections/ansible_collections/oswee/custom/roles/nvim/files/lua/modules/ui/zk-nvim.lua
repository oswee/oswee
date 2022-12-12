local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.ui.zk-nvim] Packer not found")
	return
end

packer.use({
	"mickael-menu/zk-nvim",
	disable = false,
	opt = false,
	-- requires = {
	-- 	{ "nvim-telescope/telescope.nvim" },
	-- 	{ "renerocksai/calendar-vim" },
	-- },
	config = function()
		-- local commands = require("zk.commands")

		require("zk").setup({
			picker = "telescope",

			lsp = {
				-- `config` is passed to `vim.lsp.start_client(config)`
				config = {
					-- cmd = { "zk", "lsp", "--log", "/tmp/zk-lsp.log" },
					cmd = { "zk", "lsp" },
					name = "zk",
					-- on_attach = ...
					-- etc, see `:h vim.lsp.start_client()`
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})

		-- local function make_edit_fn(defaults, picker_options)
		-- 	return function(options)
		-- 		options = vim.tbl_extend("force", defaults, options or {})
		-- 		zk.edit(options, picker_options)
		-- 	end
		-- end
		--
		-- local function make_new_fn(defaults)
		-- 	return function(options)
		-- 		options = vim.tbl_extend("force", defaults, options or {})
		-- 		zk.new(options)
		-- 	end
		-- end

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
		-- commands.add("ZkTodayyy", function()
		-- 	local timestamp = os.time(os.date("*t"))
		--
		-- 	zk.new({ group = "daily", dir = "Daily" })
		-- end)
		-- commands.add("ZkNewDaily", make_new_fn({ dir = "Daily" }))

		vim.keymap.set("n", "<leader>zc", "<cmd>ZkCd<cr>", { desc = "zk-nvim | CD into notebook root" })
		vim.keymap.set("n", "<leader>zi", "<cmd>ZkIndex<cr>", { desc = "zk-nvim | Index the notebook" })
		vim.keymap.set("n", "<leader>zb", "<cmd>ZkBackLinks<cr>", { desc = "zk-nvim | Open backlinks" })
		vim.keymap.set(
			"n",
			"<leader>zn",
			"<cmd>ZkNew { title = vim.fn.input('Title: ')}<cr>",
			{ desc = "zk-nvim | New note" }
		)
		vim.keymap.set("n", "<leader>zo", "<cmd>ZkNotes { sort = {'modified'}}<cr>", { desc = "zk-nvim | Open notes" })
		vim.keymap.set(
			"n",
			"<Leader>zf",
			"<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<cr>",
			{ desc = "zk-nvim | Query notes" }
		)
		vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<cr>", { desc = "zk-nvim | Filter notes by tag" })
		vim.keymap.set(
			"n",
			"<leader>zm",
			"<cmd>'<,'>ZkMatch<cr>",
			{ desc = "zk-nvim | Search by last visual selection" }
		)
		vim.keymap.set(
			"v",
			"<leader>zm",
			"<cmd>'<,'>ZkMatch<cr>",
			{ desc = "zk-nvim | Search by last visual selection" }
		)
	end,
})
