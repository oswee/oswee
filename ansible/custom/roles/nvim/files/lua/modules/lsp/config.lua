local ok, lspconfig = pcall(require, 'lspconfig')
if (not ok) then return end

local on_attach = require('modules.lsp.handlers').on_attach
local capabilities = require('modules.lsp.handlers').capabilities

local sumneko_opts = require('modules.lsp.opts.sumneko_lua')
local efm_opts = require('modules.lsp.opts.efm')
local yamlls_opts = require('modules.lsp.opts.yamlls')
local ansiblels_opts = require('modules.lsp.opts.ansiblels')
local stylelint_opts = require('modules.lsp.opts.stylelint')
local terraformls_opts = require('modules.lsp.opts.terraformls')

local servers = {
  'sumneko_lua',
  'efm',
  'gopls',
  'tsserver',
  -- 'bashls',
  -- 'pyright',
  'yamlls',
  'ansiblels',
  -- 'html',
  -- 'jsonls',
  'stylelint_lsp',
  'terraformls',
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }

  if server == 'sumneko_lua' then
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  if server == 'efm' then
    opts = vim.tbl_deep_extend('force', efm_opts, opts)
  end

  if server == 'yamlls' then
    opts = vim.tbl_deep_extend('force', yamlls_opts, opts)
  end

  if server == 'ansiblels' then
    opts = vim.tbl_deep_extend('force', ansiblels_opts, opts)
  end

  if server == 'stylelint_lsp' then
    opts = vim.tbl_deep_extend('force', stylelint_opts, opts)
  end

  if server == 'terraformls' then
    opts = vim.tbl_deep_extend('force', terraformls_opts, opts)
  end

  lspconfig[server].setup(opts)
end
