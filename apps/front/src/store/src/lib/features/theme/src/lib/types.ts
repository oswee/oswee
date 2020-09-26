import { Types } from './constants'

interface SwitchThemeAction {
  readonly type: Types.SWITCH
  readonly meta: object
  readonly payload: object
}

export type ActionTypes = SwitchThemeAction
