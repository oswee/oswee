local helpers = {}

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

-- https://github.com/mnabila/nvimrc/blob/65b4b9ccf7891f6f1a27bc83223934055cb2905a/lua/modules/completion/lsp/custom.lua
function helpers.custom_cwd()
  if vim.loop.cwd() == vim.loop.os_homedir() then
    return vim.fn.expand("%:p:h")
  end
  return vim.loop.cwd()
end

return helpers

