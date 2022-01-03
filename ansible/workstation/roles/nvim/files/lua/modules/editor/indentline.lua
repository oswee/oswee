local ok, indentline = pcall(require, 'indent_blankline')
if (not ok) then return end

-- vim.opt.list = true
-- vim.opt.listchars:append('space:⋅')
-- vim.opt.listchars:append('eol:↴')

-- vim.g.indent_blankline_enabled = true

indentline.setup({
  -- char = '▏',
  char_list = {'|', '¦', '┆', '┊'},
  filetype_exclude = { '', 'dashboard', 'terminal', 'help', 'packer', 'NvimTree', 'sagahover', 'markdown', 'undotree' },
  buftype_exclude = { 'terminal' },
  use_treesitter = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
  -- indentLine_setColors = 1,
  context_patterns = {
    "class",
    "function",
    "method",
    "if",
    "table",
    "dictionary",
    "list",
    "parameters",
    "expression_list",
    "for_statement"
  },
})
