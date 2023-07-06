return {
	'L3MON4D3/LuaSnip',
	enabled = true,
	lazy = true,
	config = function()
		local plugin = require('luasnip')
		local types = require('luasnip.util.types')

		plugin.config.set_config({
			history = true,
			updateevents = 'TextChanged,TextChangedI',
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { '<-', 'Error' } },
					},
				},
			},
		})
	end,
}
