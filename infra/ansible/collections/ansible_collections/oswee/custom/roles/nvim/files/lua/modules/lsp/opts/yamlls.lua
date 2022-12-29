return {
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.1-standalone-strict/all.json"] = "/*.k8s.yaml",
			},
		},
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
}
