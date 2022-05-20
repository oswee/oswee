-- Server settings: https://github.com/redhat-developer/yaml-language-server#language-server-settings
return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = {
    'helm',
    'yaml',
    'yaml.ansible',
    'yaml.docker-compose',
  },
  single_file_support = true,
  settings = {
    editor = {
      tabSize = 2,
    },
    yaml = {
      hover = true,
      completion = true,
      format = {
        enable = false,
        singleQuote = true,
        bracketSpacing = true,
      },
      validate = true,
      schemaStore = {
        enable = true,
        url = 'https://www.schemastore.org/api/json/catalog.json',
      },
      schemas = {
        -- ['https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json'] = '/*.k8s.yaml',
        kubernetes = {
          '*.k8s.yaml',
        },
        ['https://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
        ['https://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
        ['https://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
        ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
        ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['https://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
        ['https://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
        ['https://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
        ['https://json.schemastore.org/gitlab-ci'] = '*gitlab-ci*.{yml,yaml}',
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose.{yml,yaml}',
        ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*flow*.{yml,yaml}'
      },
    },
    redhat = {
      telemetry = {
        enable = false,
      },
    },
  },
}

