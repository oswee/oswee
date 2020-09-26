import { createSelector } from 'reselect'
import { RootState } from 'Types'

const getState = (state: RootState) => state.accounts

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace Selectors {
  export const selected = createSelector([getState], state => state.selected)

  export const entities = createSelector([getState], state => state.entities)

  export const accounts = createSelector([getState], state => state.ids.map(uuid => state.entities[uuid]).sort())

  export const person = createSelector([selected, entities], (selected, entities) => entities[selected])

  export const shouldFetch = createSelector(
    [person],
    person => person === undefined, // && state.fetching === false
  )
}
