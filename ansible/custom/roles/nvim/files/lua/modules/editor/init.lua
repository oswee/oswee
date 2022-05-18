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
    -- config = lc(require('modules.editor.editorconfig')),
  }
end

function Editor.vimbazel()
  return {
    'bazelbuild/vim-bazel',
    requires = {
      'google/vim-maktaba',
    },
  }
end

function Editor.vimjinja()
  return {
    'lepture/vim-jinja',
  }
end

function Editor.ansiblevim()
  return {
    'pearofducks/ansible-vim',
  }
end

function Editor.vimwiki()
  return {
    'vimwiki/vimwiki',
  }
end

function Editor.undotree()
  return {
    'mbbill/undotree',
  }
end

function Editor.octonvim()
  return {
    'pwntester/octo.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope.nvim'},
      {'kyazdani42/nvim-web-devicons'}
    }
  }
end

function Editor.vimstartuptime()
  return {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  }
end

function Editor.vimphpcsfixer()
  return {
    'stephpy/vim-php-cs-fixer',
  }
end

return Editor
