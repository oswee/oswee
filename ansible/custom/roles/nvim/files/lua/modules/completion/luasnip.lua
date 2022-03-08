local ok, luasnip = pcall(require, 'luasnip')
if (not ok) then return end

-- local config = require 'luasnip.config'
-- local extras = require 'luasnip.extras'
local types = require 'luasnip.util.types'

-- local snippet = luasnip.snippet
-- local text = luasnip.text_node
-- local f = luasnip.function_node
-- local insert = luasnip.insert_node
-- local l = extras.lambda
-- local match = extras.match


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
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{ "<-", "Error" }},
      },
    },
  },
})

vim.keymap.set({"i", "s" }, "<c-k>", function ()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({"i", "s" }, "<c-j>", function ()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function ()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

vim.keymap.set("n", "<Leader><Leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

