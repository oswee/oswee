return {
  filetypes = {
    'yaml.ansible',
  },
  -- root_dir = vim.loop.cwd,
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
      }
    }
  }
}
