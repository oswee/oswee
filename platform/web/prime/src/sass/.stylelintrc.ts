import type { Configuration } from 'stylelint'

/**
 * Stylelint configuration.
 */
const config: Partial<Configuration> = {
  extends: '../../../../../.stylelintrc.ts',
  rules: {
    indentation: 'tab',
    linebreaks: 'unix',
  },
}

export default config
