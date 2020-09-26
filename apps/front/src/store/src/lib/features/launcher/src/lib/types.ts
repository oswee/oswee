import { Types } from './constants'
// import { LauncherState } from './models'

interface ToggleLauncherAction {
  readonly type: Types.TOGGLE
}
interface DisplayLauncherAction {
  readonly type: Types.DISPLAY
}
interface HideLauncherAction {
  readonly type: Types.HIDE
}
interface LauncherDisplayedAction {
  readonly type: Types.DISPLAYED
}
interface LauncherHiddenAction {
  readonly type: Types.HIDDEN
}

export type ActionTypes =
  | ToggleLauncherAction
  | DisplayLauncherAction
  | LauncherDisplayedAction
  | HideLauncherAction
  | LauncherHiddenAction
