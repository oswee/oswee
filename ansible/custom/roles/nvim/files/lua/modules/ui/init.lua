local lc = require('helpers.common').loadConfig

local Ui = {}

function Ui.devicons()
  return {
    'kyazdani42/nvim-web-devicons',
    opt = true
  }
end

function Ui.theme()
  return {
    'ellisonleao/gruvbox.nvim',
    requires = {'rktjmp/lush.nvim'},
    config = lc(require('modules.ui.gruvbox')),
  }
end

function Ui.filemanager()
  return {
    'kyazdani42/nvim-tree.lua',
    wants = 'nvim-web-devicons',
    requires = Ui.devicons(),
    config = lc(require('modules.ui.nvim-tree')),
  }
end

function Ui.statusline()
  return {
    'hoob3rt/lualine.nvim',
    wants = 'nvim-web-devicons',
    requires = Ui.devicons(),
    config = lc(require('modules.ui.lualine')),
  }
end

function Ui.telescope()
  return {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
    config = lc(require('modules.ui.telescope')),
  }
end

function Ui.dashboard()
  return {
    'glepnir/dashboard-nvim',
    requires = Ui.telescope(),
    config = lc(require('modules.ui.dashboard')),
  }
end

function Ui.whichkey()
  return {
    'folke/which-key.nvim',
    config = lc(require('modules.ui.which-key')),
  }
end

function Ui.symbols()
  return {
    'simrat39/symbols-outline.nvim',
    config = lc(require('modules.ui.symbols-outline')),
  }
end

function Ui.fugitive()
  return {
    'tpope/vim-fugitive',
  }
end

return Ui
