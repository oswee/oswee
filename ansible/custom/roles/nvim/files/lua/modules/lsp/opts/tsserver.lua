local custom_cwd = require('helpers.common').custom_cwd

return {
  -- root_dir = custom_cwd,
  settings = {
    tsserver = {
      useBatchedBufferSync = true,
    },
    javascript = {
      autoClosingTags = true,
      suggest = {
        autoImports = true,
      },
      updateImportsOnFileMove = {
        enable = true,
      },
      suggestionActions = {
        enabled = false,
      },
    },
  },
}

