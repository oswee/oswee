-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/lsp/status.lua

local ok, lspstatus = pcall(require, 'lsp-status')
if (not ok) then return end


local status = {}

status.select_symbol = function(cursor_pos, symbol)
  if symbol.valueRange then
    local value_range = {
      ['start'] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[1]),
      },
      ['end'] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[2]),
      },
    }

    return require('lsp-status.util').in_range(cursor_pos, value_range)
  end
end

status.activate = function()
  lspstatus.config {
    select_symbol = status.select_symbol,

    indicator_errors = '',
    indicator_warnings = '',
    indicator_info = '🛈',
    indicator_hint = '!',
    indicator_ok = '',
    spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
  }

  lspstatus.register_progress()
end

status.on_attach = function(client)
  lspstatus.on_attach(client)

  vim.cmd [[augroup tj_lsp_status]] -- Waz iz zas?
  vim.cmd [[autocmd CursorHold,BufEnter <buffer> lua require('lsp-status').update_current_function()]]
  vim.cmd [[augroup END]]
end

return status
