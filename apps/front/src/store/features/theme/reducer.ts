import { ThemeTypes, ThemeActionTypes } from './types'
import { ThemeState } from './models'

export { ThemeState }

const initialState: ThemeState = {
  active: 'light',
  light: {
    '--root-layout-background-color': 'hsla(0, 0%, 100%, 1)',
    '--root-layout-border-color': 'hsla(200, 14%, 96%, 1)',
    '--root-primary-cta-background-color': 'hsla(200, 14%, 96%, 1)',
    '--root-primary-cta-text-color': 'hsla(215, 14%, 19%, 1)',
    '--root-secondary-cta-background-color': 'hsla(215, 100%, 50%, 1)',
    '--root-secondary-cta-text-color': 'hsla(0, 0%, 100%, 1)',
    '--root-text-color': 'hsla(212, 14%, 19%, 1)',
  },
  dark: {
    '--root-layout-background-color': 'hsla(215, 14%, 19%, 1)',
    '--root-layout-border-color': 'hsla(212, 14%, 24%, 1)',
    '--root-primary-cta-background-color': 'hsla(215, 15%, 16%, 1)',
    '--root-primary-cta-text-color': 'hsla(0, 0%, 100%, 1)',
    '--root-secondary-cta-background-color': 'hsla(215, 100%, 50%, 1)',
    '--root-secondary-cta-text-color': 'hsla(0, 0%, 100%, 1)',
    '--root-text-color': 'hsla(213, 14%, 72%, 1)',
  },
}

export default (state: ThemeState = initialState, action: ThemeActionTypes): ThemeState => {
  switch (action.type) {
    case ThemeTypes.SWITCH:
      // TODO: Conditional (ternary) operator
      if (state.active === 'light') {
        return {
          ...state,
          active: 'dark',
        }
      }
      return {
        ...state,
        active: 'light',
      }

    default:
      return state
  }
}
