local get_table_keys = require('helpers.common').get_table_keys

local format_on_write = true

local linters = {
  black = require('modules.lsp.opts.efm.black'),
  buf = require('modules.lsp.opts.efm.buf'),
  buildifier = require('modules.lsp.opts.efm.buildifier'),
  eslint = require('modules.lsp.opts.efm.eslint'),
  fixjson = require('modules.lsp.opts.efm.fixjson'),
  flake8 = require('modules.lsp.opts.efm.flake8'),
  goimports = require('modules.lsp.opts.efm.goimports'),
  golint = require('modules.lsp.opts.efm.golint'),
  htmllint = require('modules.lsp.opts.efm.htmllint'),
  isort = require('modules.lsp.opts.efm.isort'),
  jq = require('modules.lsp.opts.efm.jq'),
  jsonlint = require('modules.lsp.opts.efm.jsonlint'),
  luafmt = require('modules.lsp.opts.efm.luafmt'),
  markdownlint = require('modules.lsp.opts.efm.markdownlint'),
  misspell = require('modules.lsp.opts.efm.misspell'),
  mypy = require('modules.lsp.opts.efm.mypy'),
  prettier = require('modules.lsp.opts.efm.prettier'),
  shellcheck = require('modules.lsp.opts.efm.shellcheck'),
  shfmt = require('modules.lsp.opts.efm.shfmt'),
  stylelint = require('modules.lsp.opts.efm.stylelint'),
  terraform = require('modules.lsp.opts.efm.terraform'),
  vint = require('modules.lsp.opts.efm.vint'),
  yamllint = require('modules.lsp.opts.efm.yamllint'),
  phpcsfixer = require('modules.lsp.opts.efm.phpcsfixer'),
}

local lint_settings = {
  -- ["="] = {linters.misspell},
  -- vim = {linters.vint},
  -- lua = {linters.luafmt},
  -- go = {linters.golint, linters.goimports},
  -- python = {linters.black, linters.isort, linters.flake8, linters.mypy},
  -- typescript = {linters.prettier, linters.eslint},
  -- javascript = {linters.prettier, linters.eslint},
  -- yaml = {linters.yamllint},
  -- json = {linters.prettier},
  -- html = {linters.prettier},
  scss = {linters.stylelint},
  css = {linters.stylelint},
  -- markdown = {linters.prettier},
  -- sh = {linters.shellcheck},
  -- tf = {linters.terraform},
  bzl = {linters.buildifier},
}

local on_attach_efm = function(client)
  if format_on_write and client.server_capabilities.document_formatting then -- format on write
    local format = vim.api.nvim_create_augroup('Format', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
      callback = function()
        vim.lsp.buf.formatting_seq_sync({}, 1000)
      end,
      buffer = 0,
      group = format
    })
  end
end

return {
  on_attach = on_attach_efm,
  init_options = {
    documentFormatting = true,
    -- hover = true,
  },
  root_dir = vim.loop.cwd,
  settings = {
    rootMarkers = {'.git/'},
    languages = lint_settings
  },
  filetypes = get_table_keys(lint_settings),
}

