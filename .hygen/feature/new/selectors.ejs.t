---
to: src/store/features/<%= feature %>/selectors.ts
---
<%
  featureSelectors = h.changeCase.pascal(feature) + 'Selectors'
-%>
import { createSelector } from 'reselect'
import { RootState } from '../../reducer'

// INPUT/BASE SELECTORS
const getState = (state: RootState) => state.applications

// MEMOIZED SELECTORS
const selectFetchState = createSelector([getState], state => state.fetching)

export const <%= featureSelectors %> = {
  selectFetchState,
}
