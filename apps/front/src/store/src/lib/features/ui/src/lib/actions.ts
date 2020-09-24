import { UiTypes, UiActionTypes } from './types'

export const toggleAccountWidget = (): UiActionTypes => ({
  type: UiTypes.ACCOUNT_WIDGET_TOGGLE,
})

export const displayAccountWidget = (): UiActionTypes => ({
  type: UiTypes.ACCOUNT_WIDGET_DISPLAY,
})
export const loadApplication = (): UiActionTypes => ({
  type: UiTypes.APPLICATION_LOAD,
})
export const loadingApplication = (): UiActionTypes => ({
  type: UiTypes.APPLICATION_LOADING,
})
export const loadedApplication = (): UiActionTypes => ({
  type: UiTypes.APPLICATION_LOADED,
})
export const closeApplication = (): UiActionTypes => ({
  type: UiTypes.APPLICATION_CLOSE,
})
export const closedApplication = (): UiActionTypes => ({
  type: UiTypes.APPLICATION_CLOSED,
})

// Action Center
export const toggleActionCenter = (): UiActionTypes => ({
  type: UiTypes.ACTION_CENTER_TOGGLE,
  meta: { websocket: false },
})
export const displayActionCenter = (): UiActionTypes => ({
  type: UiTypes.ACTION_CENTER_DISPLAY,
  meta: { websocket: false },
})
export const actionCenterDisplayed = (): UiActionTypes => ({
  type: UiTypes.ACTION_CENTER_DISPLAYED,
  meta: { websocket: false },
})
export const hideActionCenter = (): UiActionTypes => ({
  type: UiTypes.ACTION_CENTER_HIDE,
  meta: { websocket: false },
})
export const actionCenterHidden = (): UiActionTypes => ({
  type: UiTypes.ACTION_CENTER_HIDDEN,
  meta: { websocket: false },
})
