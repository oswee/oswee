return {
  -- cmd = { "yaml-language-server", "--stdio" },
  -- cmd = { "yamllint", "--strict", "--format parsable ${INPUT}" },
  filetypes = {
    'yaml',
    'yaml.docker-compose',
    'yaml.ansible',
  },
  single_file_support = true,
  completion_menu_label = 'YAML',
  settings = {
    yaml = {
      rootMarkers = {'.yamllint.yaml'},
      hover = true,
      completion = true,
      validate = true,
      schemaStore = {
        -- enable = true,
        -- url = "https://www.schemastore.org/api/json/catalog.json",
        url = '',
        enable = false,
      },
      schemas = {
        ['https://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yaml,yml}',
      },
    },
    redhat = {
      telemetry = {
        enable = false,
      },
    },
  },
}

