local ok, lspcolors = pcall(require, 'lsp-colors')
if not ok then
  local errmsg = '[LSP] `lsp-colors` plugin not installed! Please install via your plugin manager.'
  vim.api.nvim_err_writeln(errmsg)
  return
end

lspcolors.setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

