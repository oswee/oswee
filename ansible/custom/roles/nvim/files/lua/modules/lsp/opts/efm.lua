local linters = require('modules.lsp.efm')
local get_table_keys = require('helpers.common').get_table_keys

local format_on_write = true

local lint_settings = {
  ["="] = {linters.misspell},
  vim = {linters.vint},
  lua = {linters.luafmt},
  go = {linters.golint, linters.goimports},
  python = {linters.black, linters.isort, linters.flake8, linters.mypy},
  typescript = {linters.prettier, linters.eslint},
  javascript = {linters.prettier, linters.eslint},
  yaml = {linters.yamllint},
  json = {linters.prettier},
  html = {linters.prettier},
  scss = {linters.prettier},
  css = {linters.stylelint},
  markdown = {linters.prettier},
  sh = {linters.shellcheck},
  tf = {linters.terraform},
  bzl = {linters.buildifier},
}

local on_attach_efm = function(client)
  if format_on_write and client.resolved_capabilities.document_formatting then -- format on write
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync({}, 1000)]] -- Use all formatters
    vim.api.nvim_command [[augroup END]]
  end
end

return {
  on_attach = on_attach_efm,
  init_options = {
    documentFormatting = true,
    hover = true,
  },
  root_dir = vim.loop.cwd,
  settings = {
    rootMarkers = {'.git/'},
    languages = lint_settings
  },
  filetypes = get_table_keys(lint_settings),
}

