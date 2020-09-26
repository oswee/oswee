import { ActionTypes } from './types'
import { Types } from './constants'

export const toggleAccountWidget = (): ActionTypes => ({
  type: Types.ACCOUNT_WIDGET_TOGGLE,
})

export const displayAccountWidget = (): ActionTypes => ({
  type: Types.ACCOUNT_WIDGET_DISPLAY,
})
export const loadApplication = (): ActionTypes => ({
  type: Types.APPLICATION_LOAD,
})
export const loadingApplication = (): ActionTypes => ({
  type: Types.APPLICATION_LOADING,
})
export const loadedApplication = (): ActionTypes => ({
  type: Types.APPLICATION_LOADED,
})
export const closeApplication = (): ActionTypes => ({
  type: Types.APPLICATION_CLOSE,
})
export const closedApplication = (): ActionTypes => ({
  type: Types.APPLICATION_CLOSED,
})

// Action Center
export const toggleActionCenter = (): ActionTypes => ({
  type: Types.ACTION_CENTER_TOGGLE,
  meta: { websocket: false },
})
export const displayActionCenter = (): ActionTypes => ({
  type: Types.ACTION_CENTER_DISPLAY,
  meta: { websocket: false },
})
export const actionCenterDisplayed = (): ActionTypes => ({
  type: Types.ACTION_CENTER_DISPLAYED,
  meta: { websocket: false },
})
export const hideActionCenter = (): ActionTypes => ({
  type: Types.ACTION_CENTER_HIDE,
  meta: { websocket: false },
})
export const actionCenterHidden = (): ActionTypes => ({
  type: Types.ACTION_CENTER_HIDDEN,
  meta: { websocket: false },
})
