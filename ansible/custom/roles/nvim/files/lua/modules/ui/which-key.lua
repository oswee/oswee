local status, plugin = pcall(require, "which-key")
if (not status) then return end

plugin.setup()
