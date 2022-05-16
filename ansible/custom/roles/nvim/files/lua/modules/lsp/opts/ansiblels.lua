local util = require 'lspconfig.util'

return {
  filetypes = {
    'yaml.ansible',
  },
  root_dir = util.root_pattern('ansible.cfg', '.ansible-lint'),
  single_file_support = true,
  settings = {
    ansible = {
      ansible = {
        path = 'ansible'
      },
      ansibleLint = {
        enabled = true,
        path = 'ansible-lint'
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = 'python'
      },
      workspace = {
        -- library = {
        --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        --   [vim.fn.stdpath("config") .. "/lua"] = true,
        -- },
      },
    },
  },
}
