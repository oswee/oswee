return {
	'nvim-treesitter/nvim-treesitter',
	enabled = true,
	lazy = false,
	build = ':TSUpdate',
	dependencies = {
		'p00f/nvim-ts-rainbow',
		'windwp/nvim-ts-autotag',
		'nvim-treesitter/nvim-treesitter-textobjects',
		{ "nvim-treesitter/playground",
			cmd = "TSPlaygroundToggle",
		},
	},
	config = function()
		local plugin = require('nvim-treesitter.configs')

		plugin.setup({
			ensure_installed = {
				'bash',
				'css',
				'dockerfile',
				'gitcommit',
				'go',
				'gomod',
				'gosum',
				'gowork',
				'hcl',
				'html',
				'javascript',
				'jsdoc',
				'json',
				'json5',
				'lua',
				'make',
				'markdown',
				'markdown_inline',
				'php',
				'proto',
				'python',
				'regex',
				'rust',
				'scss',
				'starlark',
				'terraform',
				'toml',
				'typescript',
				'vim',
				'yaml',
				-- 'comment',  -- Some are indicating that this slows down TS big time
			},
			sync_install = false,
			ignore_install = {},
			highlight = {
				enable = true, -- Will disable all HL. Check with :TSModuleInfo
				disable = {},
				-- additional_vim_regex_highlighting = false,
				additional_vim_regex_highlighting = { 'markdown' }, -- For the zk-nvim
				use_languagetree = true,
			},
			indent = {
				enable = true,
			},
			-- additional_vim_regex_highlighting = { "markdown" },
			autotag = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
			},
			textobjects = {
				select = {
					enable = false,
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move = {
					enable = false,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer' },
					goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer' },
					goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer' },
					goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer' },
				},
				lsp_interop = {
					enable = false,
					peek_definition_code = {
						['gD'] = '@function.outer',
					},
				},
			},
		})

	end,
}
