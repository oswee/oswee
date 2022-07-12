module.exports = {
	extends: [
		'stylelint-config-standard',
		// 'stylelint-config-standard-scss',
		// 'stylelint-config-prettier-scss',
		// 'stylelint-config-sass-guidelines',
		'stylelint-config-idiomatic-order',
	],
	// plugins: ['postcss-import'],
	// rules: {
	//   'color-hex-length': 'long',
	//   indentation: 'tab',
	// },
	customSyntax: 'postcss-lit',
}
