local lc = require('helpers.common').loadConfig

local Lsp = {}

function Lsp.config()
  return {
    'neovim/nvim-lspconfig',
    config = lc(require('modules.lsp.config')),
  }
end

-- function Lsp.installer()
--   return {
--     'williamboman/nvim-lsp-installer',
--     requires = Lsp.config(),
--     config = lc(require('modules.lsp.installer')),
--   }
-- end

function Lsp.saga()
  return {
    -- 'glepnir/lspsaga.nvim' is abandoned
    'tami5/lspsaga.nvim',
    requires = Lsp.config(),
    config = lc(require('modules.lsp.saga')),
  }
end

function Lsp.status()
  return {
    'nvim-lua/lsp-status.nvim',
    config = lc(require('modules.lsp.status')),
  }
end

function Lsp.signture()
  return {
    'ray-x/lsp_signature.nvim',
    config = lc(require('modules.lsp.signature')),
  }
end

return Lsp
