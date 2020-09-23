import { createSelector } from 'reselect'
import { RootState } from '../../reducer'
import { SystemState } from './models'

// INPUT/BASE SELECTORS
const getState = (state: RootState): SystemState => state.system

// MEMOIZED SELECTORS
const selectFetchState = createSelector([getState], state => state.selected)

export const SystemSelectors = {
  selectFetchState,
}
