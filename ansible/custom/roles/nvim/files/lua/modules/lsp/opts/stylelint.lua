local util = require 'lspconfig.util'

return {
  root_dir = util.root_pattern('.stylelintrc.cjs'),
  settings = {
    stylelintplus = {
      autoFixOnFormat = true,
      autoFixOnSave = true,
      cssInJs = true,
    },
  },
  filetypes = {
    'css',
    'scss',
    'typescript',
  },
}
