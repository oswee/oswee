local ok, lualine = pcall(require, 'lualine')
if (not ok) then return end

local vim = vim

local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = {
    "⠋",
    "⠙",
    "⠹",
    "⠸",
    "⠼",
    "⠴",
    "⠦",
    "⠧",
    "⠇",
    "⠏",
  }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd("autocmd User LspProgressUpdate let &ro = &ro")

lualine.setup{
  options = {
    theme = 'gruvbox',
    icons_enabled = true,
    section_separators = { '', '' },
    component_separators = { '', '' },
    disabled_filetypes = {'alpha', 'dashboard', 'NvimTree', 'Outline'},
    always_divide_middle = true,
  },
  sections = {
    lualine_b = { 'branch', 'diff', 'GitStatusCount' },
    lualine_x = {
      { 'diagnostics',
        sources = { 'nvim_diagnostic' },
        color_error = '#CC241D',
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding',
      'filetype',
      lsp_progress
    },
    lualine_y = { 'progress' },
    -- lualine_z = { 'location' },
    lualine_z = { 'location',
      {function()
        return vim.fn.search([[\s\+$]], 'nw') ~= 0 and 'trailing' or ''
      end,
      icon = '', -- What ever icon you want
      color  = {bg='#ff5a50'}},
      {function()
        local space_indent = vim.fn.search([[\v^ +]], 'nw') > 0
        local tab_indent = vim.fn.search([[\v^\t+]], 'nw') > 0
        local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], 'nw') > 0)
        return mixed and 'mixed-indent' or ''
      end,
      icon = '',
      color = {bg='#bb2200'}}
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fzf', 'nvim-tree', 'fugitive' },
}
