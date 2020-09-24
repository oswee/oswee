// import { LauncherState } from './models'

export enum LauncherTypes {
  TOGGLE = 'LAUNCHER_TOGGLE',
  DISPLAY = 'LAUNCHER_DISPLAY',
  DISPLAYED = 'LAUNCHER_DISPLAYED',
  HIDE = 'LAUNCHER_HIDE',
  HIDDEN = 'LAUNCHER_HIDDEN',
}

interface ToggleLauncherAction {
  readonly type: LauncherTypes.TOGGLE
}
interface DisplayLauncherAction {
  readonly type: LauncherTypes.DISPLAY
}
interface HideLauncherAction {
  readonly type: LauncherTypes.HIDE
}
interface LauncherDisplayedAction {
  readonly type: LauncherTypes.DISPLAYED
}
interface LauncherHiddenAction {
  readonly type: LauncherTypes.HIDDEN
}

export type LauncherActionTypes =
  | ToggleLauncherAction
  | DisplayLauncherAction
  | LauncherDisplayedAction
  | HideLauncherAction
  | LauncherHiddenAction
