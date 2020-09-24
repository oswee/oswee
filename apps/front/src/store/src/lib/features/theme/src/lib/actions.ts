import { ThemeTypes, ThemeActionTypes } from './types'

export const switchTheme = (): ThemeActionTypes => ({
  type: ThemeTypes.SWITCH,
  meta: { websocket: false },
  payload: { theme: 'dark' },
})
