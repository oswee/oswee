return {
	settings = {
		json = {
			schemas = {
				{
					description = "Node package configuration file",
					fileMatch = {
						"package.json",
					},
					url = "https://json.schemastore.org/package.json",
				},
				{
					description = "TypeScript compiler configuration file",
					fileMatch = {
						"tsconfig.json",
						"tsconfig.*.json",
					},
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					description = "ESLint config",
					fileMatch = {
						".eslintrc.json",
						".eslintrc",
					},
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					description = "Prettier config",
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc",
				},
				{
					description = "Stylelint config",
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "https://json.schemastore.org/stylelintrc",
				},
				{
					description = "golangci-lint configuration file",
					fileMatch = {
						".golangci.toml",
						".golangci.json",
					},
					url = "https://json.schemastore.org/golangci-lint.json",
				},
				{
					description = "Resume json",
					fileMatch = { "resume.json" },
					url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
				},
			},
		},
		setup = {
			commands = {
				Format = {
					function()
						vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
					end,
				},
			},
		},
	},
}
