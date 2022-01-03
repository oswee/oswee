local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not ok) then return end

-- Examples:
-- https://github.com/agusthas/dotfiles/blob/85fbfcfb77ef668997dfdca8fd8681298d3abefa/nvim/.config/nvim/lua/config/treesitter.lua
--

treesitter.setup({
  ensure_installed = {
    'bash',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'python',
    'toml',
    'yaml',
    'markdown',
  },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {}
  },
  indent = { enable = true },
  additional_vim_regex_highlighting = { 'markdown' },
})
