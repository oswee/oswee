local vim = vim
local api = vim.api
local cmd = vim.cmd

local helpers = {}

helpers.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

return helpers
