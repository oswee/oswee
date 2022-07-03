module.exports = {
	printWidth: 120,
	semi: false,
	singleQuote: true,
	trailingComma: 'all',
	arrowParens: 'avoid',
	bracketSpacing: true,
	endOfLine: 'lf',
	htmlWhitespaceSensitivity: 'css',
	overrides: [
		{
			files: '*.ts.lint',
			options: {
				parser: 'typescript',
			},
		},
	],
}
