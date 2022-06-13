local lspconfig = require("lspconfig")

return {
	root_dir = lspconfig.util.root_pattern(".stylelintrc", "package.json", ".stylelintrc.js", "stylelint.config.cjs"),
	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
			autoFixOnSave = true,
			cssInJs = true,
			-- configFile = vim.fn.expand('~/.config/.stylelintrc.json'),
		},
	},
	filetypes = {
		"css",
		"scss",
		-- "typescript",
	},
}
