local util = require 'lspconfig.util'

return {
  cmd = { 'rust-analyzer' },
  filetypes = {
    'rust',
  },
  root_dir = util.root_pattern('Cargo.toml', 'rust-project.json'),
  settings = {
    ['rust-analyzer'] = {
        assist = {
            importGranularity = 'module',
            importPrefix = 'self',
        },
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
     }
  }
}

