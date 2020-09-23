import { createSelector } from 'reselect'
import { RootState } from '../../reducer'
import { UiState } from './reducer'

const getState = (state: RootState): UiState => state.ui

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace UiSelectors {
  export const getActionCenterVisibility = createSelector(
    [getState],
    actionCenter => actionCenter.isActionCenterDisplayed,
  )
  export const getAccountWidgetVisibility = createSelector([getState], launcher => launcher.isAccountWidgetDisplayed)
}
