import { Types } from './constants'

interface ToggleAccountWidgetAction {
  readonly type: Types.ACCOUNT_WIDGET_TOGGLE
}
interface DisplayAccountWidgetAction {
  readonly type: Types.ACCOUNT_WIDGET_DISPLAY
}
interface LoadApplicationAction {
  readonly type: Types.APPLICATION_LOAD
}
interface LoadingApplicationAction {
  readonly type: Types.APPLICATION_LOADING
}
interface LoadedApplicationAction {
  readonly type: Types.APPLICATION_LOADED
}
interface CloseApplicationAction {
  readonly type: Types.APPLICATION_CLOSE
}
interface ClosedApplicationAction {
  readonly type: Types.APPLICATION_CLOSED
}

interface ToggleActionCenterAction {
  readonly type: Types.ACTION_CENTER_TOGGLE
  readonly meta: object
}
interface DisplayActionCenterAction {
  readonly type: Types.ACTION_CENTER_DISPLAY
  readonly meta: object
}
interface ActionCenterDisplayedAction {
  readonly type: Types.ACTION_CENTER_DISPLAYED
  readonly meta: object
}
interface HideActionCenterAction {
  readonly type: Types.ACTION_CENTER_HIDE
  readonly meta: object
}
interface ActionCenterHiddenAction {
  readonly type: Types.ACTION_CENTER_HIDDEN
  readonly meta: object
}

export type ActionTypes =
  | ToggleAccountWidgetAction
  | DisplayAccountWidgetAction
  | LoadApplicationAction
  | LoadingApplicationAction
  | LoadedApplicationAction
  | CloseApplicationAction
  | ClosedApplicationAction
  | ToggleActionCenterAction
  | DisplayActionCenterAction
  | ActionCenterDisplayedAction
  | HideActionCenterAction
  | ActionCenterHiddenAction
