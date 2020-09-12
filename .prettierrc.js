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
    // {
    //   // Add angular specific parser for all our angular templates
    //   files: [
    //     'libs/barista-components/**/*.html',
    //     'apps/{barista-design-system,components-e2e,demos,dev,universal,fluid-dev}/**/*.html',
    //   ],
    //   options: { parser: 'angular' },
    // },
    // {
    //   // For the web components use the Lighting Web Components prettier parser
    //   // extends the html parser and adds LWC-specific syntax
    //   // for unquoted template attributes
    //   files: ['libs/fluid-elements/**/*.html'],
    //   options: { parser: 'lwc' },
    // },
  ],
}
