import { ActionTypes } from './types'
import { IState } from './models'
import { Types } from './constants'

export { IState }

const initialState: IState = {
  isLauncherDisplayed: false,
}

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.TOGGLE:
      return { ...state, isLauncherDisplayed: !state.isLauncherDisplayed }

    case Types.DISPLAY:
      return { ...state, isLauncherDisplayed: true }

    case Types.DISPLAYED:
      return { ...state, isLauncherDisplayed: true }

    case Types.HIDE:
      return { ...state, isLauncherDisplayed: false }

    case Types.HIDDEN:
      return { ...state, isLauncherDisplayed: false }
    default:
      return state
  }
}
