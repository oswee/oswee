import { ActionTypes } from './types'
import { Types } from './constants'
import { IState } from './models'

export { IState }

const initialState: IState = {
  isActionCenterDisplayed: true,
  isAccountWidgetDisplayed: false,
  application: {
    state: false,
  },
}

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.ACCOUNT_WIDGET_TOGGLE:
      return { ...state, isAccountWidgetDisplayed: !state.isAccountWidgetDisplayed }

    case Types.ACCOUNT_WIDGET_DISPLAY:
      return { ...state, isAccountWidgetDisplayed: true }

    case Types.ACTION_CENTER_TOGGLE:
      return { ...state, isActionCenterDisplayed: !state.isActionCenterDisplayed }

    case Types.ACTION_CENTER_DISPLAY:
      return { ...state, isActionCenterDisplayed: true }

    case Types.ACTION_CENTER_DISPLAYED:
      return { ...state, isActionCenterDisplayed: true }

    case Types.ACTION_CENTER_HIDE:
      return { ...state, isActionCenterDisplayed: false }

    case Types.ACTION_CENTER_HIDDEN:
      return { ...state, isActionCenterDisplayed: false }

    default:
      return state
  }
}
