-- https://github.com/mnabila/nvimrc/blob/65b4b9ccf7891f6f1a27bc83223934055cb2905a/lua/modules/packer/init.lua

local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if (not ok) then return end

local on_attach = require('modules.lsp.handlers').on_attach
local capabilities = require('modules.lsp.handlers').capabilities

local sumneko_opts = require('modules.lsp.opts.sumneko_lua')
local gopls_opts = require('modules.lsp.opts.gopls')
local efm_opts = require('modules.lsp.opts.efm')

local servers = {
  'bashls',
  'gopls',
  'pyright',
  'yamlls',
  'vimls',
  'sumenko_lua',
  'tsserver',
  'eslint',
  'ansiblels',
  'cssls',
  'html',
  'jsonls',
  'stylelint_lsp',
  'terraformls',
  'efm',
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      server:install()
    end
  end
end

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = '',
      server_pending = '➜',
      server_uninstalled = '窱',
    },
    keymaps = {
      toggle_server_expand = '<CR>',
      install_server = 'i',
      update_server = 'u',
      update_all_servers = 'U',
      uninstall_server = 'X',
    },
  },
  log_level = vim.log.levels.DEBUG,
  max_concurrent_installers = 4,
}

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    if server.name == 'sumneko_lua' then
      opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    if server.name == 'gopls' then
      opts = vim.tbl_deep_extend('force', gopls_opts, opts)
    end

    if server.name == 'efm' then
      opts = vim.tbl_deep_extend('force', efm_opts, opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
