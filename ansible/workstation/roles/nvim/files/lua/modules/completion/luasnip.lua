local ok, luasnip = pcall(require, 'luasnip')
if (not ok) then return end

local config = require 'luasnip.config'
local extras = require 'luasnip.extras'
local types = require 'luasnip.util.types'

local snippet = luasnip.snippet
local text = luasnip.text_node
local f = luasnip.function_node
local insert = luasnip.insert_node
local l = extras.lambda
local match = extras.match


-- luasnip.setup({
--   history = false,
--   region_check_events = 'CursorMoved,CursorHold,InsertEnter',
--   delete_check_events = 'InsertLeave',
--   ext_opts = {
--     [types.choiceNode] = {
--       active = {
--         virt_text = { { '●', 'Operator' } },
--       },
--     },
--     [types.insertNode] = {
--       active = {
--         virt_text = { { '●', 'Type' } },
--       },
--     },
--   },
--   enable_autosnippets = true,
-- })

luasnip.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI'
})

luasnip.snippets = {
  lua = {
    snippet({
      trig = 'use',
      name = 'packer use',
      dscr = {
        'packer use plugin block',
        'e.g.',
        "use {'author/plugin'}",
      },
    }, {
      text "use { '",
      -- Get the author and URL in the clipboard and auto populate the author and project
      f(function(_)
        local default = 'author/plugin'
        local clip = fn.getreg '*'
        if not vim.startswith(clip, 'https://github.com/') then
          return default
        end
        local parts = vim.split(clip, '/')
        if #parts < 2 then
          return default
        end
        local author, project = parts[#parts - 1], parts[#parts]
        return author .. '/' .. project
      end, {}),
      text "' ",
      insert(2, { ', config = function()', '', 'end' }),
      text '}',
    }),
  },
}
