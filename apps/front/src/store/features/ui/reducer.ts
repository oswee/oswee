import { UiTypes, UiActionTypes } from './types'
import { UiState } from './models'

export { UiState }

const initialState: UiState = {
  isActionCenterDisplayed: true,
  isAccountWidgetDisplayed: false,
  application: {
    state: false,
  },
}

export default (state: UiState = initialState, action: UiActionTypes): UiState => {
  switch (action.type) {
    case UiTypes.ACCOUNT_WIDGET_TOGGLE:
      return { ...state, isAccountWidgetDisplayed: !state.isAccountWidgetDisplayed }

    case UiTypes.ACCOUNT_WIDGET_DISPLAY:
      return { ...state, isAccountWidgetDisplayed: true }

    case UiTypes.ACTION_CENTER_TOGGLE:
      return { ...state, isActionCenterDisplayed: !state.isActionCenterDisplayed }

    case UiTypes.ACTION_CENTER_DISPLAY:
      return { ...state, isActionCenterDisplayed: true }

    case UiTypes.ACTION_CENTER_DISPLAYED:
      return { ...state, isActionCenterDisplayed: true }

    case UiTypes.ACTION_CENTER_HIDE:
      return { ...state, isActionCenterDisplayed: false }

    case UiTypes.ACTION_CENTER_HIDDEN:
      return { ...state, isActionCenterDisplayed: false }

    default:
      return state
  }
}
