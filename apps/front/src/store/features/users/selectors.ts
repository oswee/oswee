import { createSelector } from 'reselect'

import { RootState } from '../../reducer'

const getState = (state: RootState) => state.users

//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace UserSelectors {
  export const selected = createSelector([getState], state => state.selected)

  export const entities = createSelector([getState], state => state.entities)

  export const users = createSelector([getState], state =>
    state.ids.map(id => state.entities[id]).sort((a, b) => a.id - b.id),
  )

  export const user = createSelector([selected, entities], (selected, entities) => entities[selected])

  export const shouldFetch = createSelector(
    [user],
    user => user === undefined, // && state.fetching === false
  )
}
