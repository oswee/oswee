module.exports = {
  arrowParens: 'avoid',
  bracketSpacing: true,
  semi: false,
  singleQuote: true,
  trailingComma: 'all',
  useTabs: false,
  tabWidth: 2,
  printWidth: 120,
  endOfLine: 'lf',
  htmlWhitespaceSensitivity: 'css',
  overrides: [
    {
      files: ['.stylelintrc'],
      options: { parser: 'json' },
    },
    { files: '*.ts.lint', options: { parser: 'typescript' } },
  ],
}
