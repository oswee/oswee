import { ActionTypes } from './types'
import { Types } from './constants'

export const switchTheme = (): ActionTypes => ({
  type: Types.SWITCH,
  meta: { websocket: false },
  payload: { theme: 'dark' },
})
