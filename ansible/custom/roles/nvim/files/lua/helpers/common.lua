local vim = vim
local api = vim.api
local cmd = vim.cmd

local helpers = {}

function helpers.create_augroup(autocmds, name)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
      cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

function helpers.get_table_keys(tab)
  local keyset = {}
  for k,_ in pairs(tab) do
    keyset[#keyset + 1] = k
  end
  return keyset
end

function helpers.get_config(name)
  print('Get Config hit')
  return string.format("require(\"%s\")", name)
end

function helpers.loadConfig(callback)
  if _G.loadConfig then
    callback()
  end
end

return helpers

