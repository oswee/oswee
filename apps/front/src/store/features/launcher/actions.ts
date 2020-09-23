import { createAction, ActionsUnion } from '../../actions'
import { LauncherTypes, LauncherActionTypes } from './types'

// ACTION CREATORS
const toggleLauncher = (): LauncherActionTypes => ({
  type: LauncherTypes.TOGGLE,
})

const displayLauncher = (): LauncherActionTypes => ({
  type: LauncherTypes.DISPLAY,
})

const hideLauncher = (): LauncherActionTypes => ({
  type: LauncherTypes.HIDE,
})

const launcherDisplayed = (): LauncherActionTypes => ({
  type: LauncherTypes.DISPLAYED,
})

const launcherHidden = (): LauncherActionTypes => ({
  type: LauncherTypes.HIDDEN,
})

export const LauncherActions = {
  toggleLauncher: () => createAction(LauncherTypes.TOGGLE, {}),
  displayLauncher: () => createAction(LauncherTypes.DISPLAY, {}),
  hideLauncher: () => createAction(LauncherTypes.HIDE, {}),
  launcherDisplayed: () => createAction(LauncherTypes.DISPLAYED, {}),
  launcherHidden: () => createAction(LauncherTypes.HIDDEN, {}),
}

export type LauncherActions = ActionsUnion<typeof LauncherActions>
