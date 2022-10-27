local lc = require('helpers.common').loadConfig

local Lsp = {}

-- vim.lsp.set_log_level("debug")

function Lsp.config()
	return {
		'neovim/nvim-lspconfig',
		config = lc(require('modules.lsp.config')),
	}
end

function Lsp.null_ls()
	return {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
		},
		config = lc(require('modules.lsp.null-ls')),
	}
end

function Lsp.trouble()
	return {
		'folke/trouble.nvim',
		requires = {
			{ 'kyazdani42/nvim-web-devicons' },
		},
		config = lc(require('modules.lsp.trouble')),
	}
end

-- Better completion popup UI
function Lsp.saga()
	return {
		-- 'glepnir/lspsaga.nvim'  -- Abandoned
		'tami5/lspsaga.nvim',
		requires = Lsp.config(),
		config = lc(require('modules.lsp.saga')),
	}
end

-- function Lsp.status()
--   return {
--     'nvim-lua/lsp-status.nvim',
--     config = lc(require('modules.lsp.status')),
--   }
-- end
--
function Lsp.signture()
	return {
		'ray-x/lsp_signature.nvim',
		config = lc(require('modules.lsp.signature')),
	}
end

function Lsp.lspcolors()
	return {
		'folke/lsp-colors.nvim',
		config = lc(require('modules.lsp.lsp-colors')),
	}
end

-- function Lsp.rusttools()
--   return {
--     'simrat39/rust-tools.nvim',
--     config = lc(require('modules.lsp.rust-tools')),
--   }
-- end

return Lsp
