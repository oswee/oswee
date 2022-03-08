local ok, luasnip = pcall(require, 'luasnip')
if (not ok) then return end

local text = luasnip.text_node
local f = luasnip.function_node
local insert = luasnip.insert_node
local snippet = luasnip.snippet

luasnip.snippets = {
  all = {
    luasnip.parser.parse_snippet("expand", "-- this is what was expanded"),
  },
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
