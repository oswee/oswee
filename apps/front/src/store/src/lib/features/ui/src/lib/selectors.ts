import { createSelector } from 'reselect'
import { RootState } from 'Types'
import { IState } from './reducer'

const getState = (state: RootState): IState => state.ui

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace Selectors {
  export const getActionCenterVisibility = createSelector(
    [getState],
    actionCenter => actionCenter.isActionCenterDisplayed,
  )
  export const getAccountWidgetVisibility = createSelector([getState], launcher => launcher.isAccountWidgetDisplayed)
}
