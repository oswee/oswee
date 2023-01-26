local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local library = {}

local function add(lib)
	for _, p in pairs(vim.fn.expand(lib, false, true)) do
		p = vim.loop.fs_realpath(p)
		library[p] = true
	end
end

add("$VIMRUNTIME")
add("~/.config/nvim")
add("~/.local/share/nvim/site/pack/packer/opt/*")
add("~/.local/share/nvim/site/pack/packer/start/*")

return {
	single_file_support = false,
	on_new_config = function(config, root)
		local libs = vim.tbl_deep_extend("force", {}, library)
		libs[root] = nil
		config.settings.Lua.workspace.library = libs
		return config
	end,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			completion = { callSnippet = "Both" },
			diagnostics = {
				globals = { "vim", "use" },
			},
			workspace = {
				library = library,
				maxPreload = 2000,
				preloadFileSize = 50000,
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
