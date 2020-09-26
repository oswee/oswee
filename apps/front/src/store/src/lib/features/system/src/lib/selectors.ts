import { createSelector } from 'reselect'
import { RootState } from 'Types'
import { IState } from './models'

// INPUT/BASE SELECTORS
const getState = (state: RootState): IState => state.system

// MEMOIZED SELECTORS
const selectFetchState = createSelector([getState], state => state.selected)

export const Selectors = {
  selectFetchState,
}
