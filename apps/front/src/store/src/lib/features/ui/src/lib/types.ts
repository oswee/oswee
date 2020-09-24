export enum UiTypes {
  ACCOUNT_WIDGET_TOGGLE = 'UI_ACCOUNT_WIDGET_TOGGLE',
  ACCOUNT_WIDGET_DISPLAY = 'UI_ACCOUNT_WIDGET_DISPLAY',

  APPLICATION_LOAD = 'UI_APPLICATION_LOAD',
  APPLICATION_LOADING = 'UI_APPLICATION_LOADING',
  APPLICATION_LOADED = 'UI_APPLICATION_LOADED',
  APPLICATION_CLOSE = 'UI_APPLICATION_CLOSE',
  APPLICATION_CLOSED = 'UI_APPLICATION_CLOSED',

  ACTION_CENTER_TOGGLE = 'UI_ACTION_CENTER_TOGGLE',
  ACTION_CENTER_DISPLAY = 'UI_ACTION_CENTER_DISPLAY',
  ACTION_CENTER_DISPLAYED = 'UI_ACTION_CENTER_DISPLAYED',
  ACTION_CENTER_HIDE = 'UI_ACTION_CENTER_HIDE',
  ACTION_CENTER_HIDDEN = 'UI_ACTION_CENTER_HIDDEN',
}

interface ToggleAccountWidgetAction {
  readonly type: UiTypes.ACCOUNT_WIDGET_TOGGLE
}
interface DisplayAccountWidgetAction {
  readonly type: UiTypes.ACCOUNT_WIDGET_DISPLAY
}
interface LoadApplicationAction {
  readonly type: UiTypes.APPLICATION_LOAD
}
interface LoadingApplicationAction {
  readonly type: UiTypes.APPLICATION_LOADING
}
interface LoadedApplicationAction {
  readonly type: UiTypes.APPLICATION_LOADED
}
interface CloseApplicationAction {
  readonly type: UiTypes.APPLICATION_CLOSE
}
interface ClosedApplicationAction {
  readonly type: UiTypes.APPLICATION_CLOSED
}

interface ToggleActionCenterAction {
  readonly type: UiTypes.ACTION_CENTER_TOGGLE
  readonly meta: object
}
interface DisplayActionCenterAction {
  readonly type: UiTypes.ACTION_CENTER_DISPLAY
  readonly meta: object
}
interface ActionCenterDisplayedAction {
  readonly type: UiTypes.ACTION_CENTER_DISPLAYED
  readonly meta: object
}
interface HideActionCenterAction {
  readonly type: UiTypes.ACTION_CENTER_HIDE
  readonly meta: object
}
interface ActionCenterHiddenAction {
  readonly type: UiTypes.ACTION_CENTER_HIDDEN
  readonly meta: object
}

export type UiActionTypes =
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
