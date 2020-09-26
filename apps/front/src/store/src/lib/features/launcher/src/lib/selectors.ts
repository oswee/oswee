import { createSelector } from 'reselect'
import { RootState } from 'Types'
import { IState } from './models'

// INPUT/BASE SELECTORS
const getState = (state: RootState): IState => state.launcher

// MEMOIZED SELECTORS
const getLauncherVisibility = createSelector([getState], launcher => launcher.isLauncherDisplayed)

export const Selectors = {
  getLauncherVisibility,
}
