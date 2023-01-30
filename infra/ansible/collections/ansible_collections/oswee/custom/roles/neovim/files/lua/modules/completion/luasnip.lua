local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.completion.luasnip] Packer not found")
	return
end

packer.use({
	"L3MON4D3/LuaSnip",
	disable = false,
	opt = false,
	config = function()
		local ok, luasnip = pcall(require, "luasnip")
		if not ok then
			return
		end

		-- local config = require 'luasnip.config'
		-- local extras = require 'luasnip.extras'
		local types = require("luasnip.util.types")

		-- local snippet = luasnip.snippet
		-- local text = luasnip.text_node
		-- local f = luasnip.function_node
		-- local insert = luasnip.insert_node
		-- local l = extras.lambda
		-- local match = extras.match

		-- luasnip.setup({
		--   history = false,
		--   region_check_events = 'CursorMoved,CursorHold,InsertEnter',
		--   delete_check_events = 'InsertLeave',
		--   ext_opts = {
		--     [types.choiceNode] = {
		--       active = {
		--         virt_text = { { '●', 'Operator' } },
		--       },
		--     },
		--     [types.insertNode] = {
		--       active = {
		--         virt_text = { { '●', 'Type' } },
		--       },
		--     },
		--   },
		--   enable_autosnippets = true,
		-- })

		luasnip.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "<-", "Error" } },
					},
				},
			},
		})

		vim.keymap.set(
			"n",
			"<leader>cs",
			"<cmd>source ~/.config/nvim/plugin/luasnip.lua<cr>",
			{ desc = "luasnip | Source snippets" }
		)

		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { silent = true, desc = "luasnip | " })

		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { silent = true, desc = "luasnip | " })

		vim.keymap.set("i", "<c-l>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { desc = "luasnip | " })
	end,
})
