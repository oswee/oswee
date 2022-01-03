local lc = require('helpers.common').loadConfig

local Editor = {}

function Editor.treesitter()
  return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    wants = {
      'nvim-ts-rainbow',
      'nvim-ts-autotag',
    },
    requires = {
      { 'p00f/nvim-ts-rainbow', opt = true },
      { 'windwp/nvim-ts-autotag', opt = true },
      { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
    },
    config = lc(require('modules.editor.treesitter')),
  }
end

function Editor.gitsigns()
  return {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = lc(require('modules.editor.gitsigns')),
  }
end

function Editor.comment()
  return {
    'numToStr/Comment.nvim',
    config = lc(require('modules.editor.comment')),
  }
end

function Editor.indentline()
  return {
    'lukas-reineke/indent-blankline.nvim',
    config = lc(require('modules.editor.indentline')),
  }
end

function Editor.editorconfig()
  return {
    'editorconfig/editorconfig-vim',
    config = lc(require('modules.editor.editorconfig')),
  }
end

return Editor

-- use 'airblade/vim-rooter'

-- use {
--   'glepnir/lspsaga.nvim',
--   config = config('lspsaga-nvim')
-- }

-- -- use 'folke/lsp-colors.nvim'

-- use {
--   'dstein64/vim-startuptime',
--   cmd = 'StartupTime',
-- }

-- use {
--   'pwntester/octo.nvim',
--   requires = {
--     {'nvim-lua/popup.nvim'},
--     {'nvim-lua/plenary.nvim'},
--     {'nvim-telescope/telescope.nvim'},
--     {'kyazdani42/nvim-web-devicons'}
--   }
-- }
-- use 'vimwiki/vimwiki'
-- use 'lepture/vim-jinja'
-- use 'bufbuild/vim-buf'
-- use 'pearofducks/ansible-vim'
-- -- use 'dense-analysis/ale'
-- use 'mbbill/undotree'
-- use 'stephpy/vim-php-cs-fixer'


