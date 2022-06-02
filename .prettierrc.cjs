module.exports = {
  printWidth: 120,
  tabWidth: 2,
  useTabs: true,
  semi: false,
  singleQuote: true,
  trailingComma: 'all',
  arrowParens: 'avoid',
  bracketSpacing: true,
  endOfLine: 'lf',
  htmlWhitespaceSensitivity: 'css',
  overrides: [
    {
      files: ['.stylelintrc.cjs'],
      options: {
        parser: 'json',
      },
    },
    {
      files: '*.ts.lint',
      options: {
        parser: 'typescript',
      },
    },
  ],
}
