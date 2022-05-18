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

return Editor
