local handlers = {}

handlers.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    -- enable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    local LspDocumentHighlight = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
    vim.api.nvim_create_autocmd('CursorHold', {
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
      buffer = 0,  -- 0 == current buffer
      group = LspDocumentHighlight
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      callback = function()
        vim.lsp.buf.clear_references()
      end,
      buffer = 0,
      group = LspDocumentHighlight
    })
    -- vim.api.nvim_exec([[
    --   augroup lsp_document_highlight
    --   autocmd! * <buffer>
    --   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --   augroup END ]], false
    -- )
  end
end

local function lsp_keymaps(bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = bufnr })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set('n', 'C-k', vim.lsp.buf.signature_help, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>f', vim.diagnostic.open_float, { buffer = bufnr })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>g', vim.lsp.diagnostic.set_loclist, { buffer = bufnr })

  -- local opts = { noremap = true, silent = true }

  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

function handlers.on_attach(client, bufnr)
  -- if client.name == 'tsserver' then
  --   client.server_capabilities.document_formatting = false
  -- end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
-- TODO: I don't feel this is the right thing to do there.
if (not status) then return end

handlers.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return handlers
