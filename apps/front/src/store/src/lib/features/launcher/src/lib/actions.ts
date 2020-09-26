import { createAction, ActionsUnion } from 'oswee/libs/action/src/index'
import { ActionTypes } from './types'
import { Types } from './constants'

// ACTION CREATORS
const toggleLauncher = (): ActionTypes => ({
  type: Types.TOGGLE,
})

const displayLauncher = (): ActionTypes => ({
  type: Types.DISPLAY,
})

const hideLauncher = (): ActionTypes => ({
  type: Types.HIDE,
})

const launcherDisplayed = (): ActionTypes => ({
  type: Types.DISPLAYED,
})

const launcherHidden = (): ActionTypes => ({
  type: Types.HIDDEN,
})

export const LauncherActions = {
  toggleLauncher: () => createAction(Types.TOGGLE, {}),
  displayLauncher: () => createAction(Types.DISPLAY, {}),
  hideLauncher: () => createAction(Types.HIDE, {}),
  launcherDisplayed: () => createAction(Types.DISPLAYED, {}),
  launcherHidden: () => createAction(Types.HIDDEN, {}),
}

export type LauncherActions = ActionsUnion<typeof LauncherActions>
