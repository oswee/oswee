return {
	filetypes = {
		"yaml",
		"yaml.ansible",
	},
	settings = {
		yaml = {
			hover = true,
			completion = true,
			validate = true,
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.1-standalone-strict/all.json"] = "/*.k8s.yaml",
				-- ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/stylelintrc"] = ".stylelintrc.{yml,yaml}",
				["http://json.schemastore.org/golangci-lint.json"] = ".golangci.{yml,yaml}",
			},
			format = {
				enable = true,
				singleQuote = true,
			},
		},
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
}
