import { LauncherTypes, LauncherActionTypes } from './types'
import { LauncherState } from './models'

export { LauncherState }

const initialState: LauncherState = {
  isLauncherDisplayed: false,
}

export default (state: LauncherState = initialState, action: LauncherActionTypes): LauncherState => {
  switch (action.type) {
    case LauncherTypes.TOGGLE:
      return { ...state, isLauncherDisplayed: !state.isLauncherDisplayed }

    case LauncherTypes.DISPLAY:
      return { ...state, isLauncherDisplayed: true }

    case LauncherTypes.DISPLAYED:
      return { ...state, isLauncherDisplayed: true }

    case LauncherTypes.HIDE:
      return { ...state, isLauncherDisplayed: false }

    case LauncherTypes.HIDDEN:
      return { ...state, isLauncherDisplayed: false }
    default:
      return state
  }
}
