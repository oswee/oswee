import { createSelector } from 'reselect'
import { RootState } from '../../reducer'
import { LauncherState } from './models'

// INPUT/BASE SELECTORS
const getState = (state: RootState): LauncherState => state.launcher

// MEMOIZED SELECTORS
const getLauncherVisibility = createSelector([getState], launcher => launcher.isLauncherDisplayed)

export const LauncherSelectors = {
  getLauncherVisibility,
}
