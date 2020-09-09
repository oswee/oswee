module.exports = {
  '*.{ts,html,md}': ['prettier --write'],
  '*.ts': ['eslint --fix'],
  // '.*{rc,.json}': ['jsonlint  --in-place'],
}
