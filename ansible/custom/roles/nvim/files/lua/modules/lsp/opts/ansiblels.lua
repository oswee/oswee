local util = require 'lspconfig.util'

return {
  cmd = { 'ansible-language-server', '--stdio' },
  filetypes = {
    'yaml.ansible',
  },
  root_dir = util.root_pattern('ansible.cfg', '.ansible-lint'),
  single_file_support = true,
  settings = {
    ansible = {
      python = {
        interpreterPath = 'python3'
      },
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
      -- workspace = {
      --   -- library = {
      --   --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --   --   [vim.fn.stdpath("config") .. "/lua"] = true,
      --   -- },
      -- },
    },
  },
}
