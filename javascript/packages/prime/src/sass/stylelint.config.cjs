module.exports = {
  extends: ['../../../../../stylelint.config.cjs'],
  rules: {
    'selector-class-pattern': null,
    linebreaks: 'unix',
    'at-rule-no-unknown': [
      true,
      { ignoreAtRules: [ "use" ] }
    ],
  },
}
