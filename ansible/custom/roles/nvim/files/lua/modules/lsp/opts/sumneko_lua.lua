-- Clone the Sumneko/lua-language-server repository into ~/code/github.com/sumneko/lua-language-server
-- Follow the build instructions at https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
-- Probably you need to install `sudo dnf install libstdc++-static` for build to succeed.
-- Create the shell script file `touch ~/.local/bin/lua-language-server`. Without `.sh` extension.
-- Add the content of https://github.com/sumneko/lua-language-server/wiki/Precompiled-Binaries#releases example
-- Make the shell script executable `chmod u+x ~/.local/bin/lua-language-server`
-- Make sure that `~/.local/bin` is in your system $PATH
-- Don't use `cmd` in the config bellow. LspConfig by default expects `lua-language-server` executable to be in system $PATH which in this case correspond to the shell script which calls actual binaries.
-- Run the Neovim and open some Lua file
-- See the logs at `~/.cache/nvim/lsp.log`

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim', 'use' },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
