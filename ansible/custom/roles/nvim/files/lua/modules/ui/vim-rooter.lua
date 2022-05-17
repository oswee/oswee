local status, plugin = pcall(require, "vim-rooter")
if (not status) then return end

plugin.setup()
