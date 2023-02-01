return {
	root_dir = require("lspconfig").util.root_pattern("ansible.cfg", "ansible-lint.yml", ".ansible-lint"),
	filetypes = { "yaml.ansible" },
	single_file_support = true,
	settings = {
		ansible = {
			path = "ansible",
		},
	},
}
