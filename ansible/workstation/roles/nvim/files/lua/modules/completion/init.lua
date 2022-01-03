local lc = require('helpers.common').loadConfig

local Completion = {}

function Completion.cmp()
  return {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = lc(require('modules.completion.cmp')),
  }
end

function Completion.snippets()
  return {
    'L3MON4D3/LuaSnip',
    config = lc(require('modules.completion.luasnip')),
  }
end

return Completion
