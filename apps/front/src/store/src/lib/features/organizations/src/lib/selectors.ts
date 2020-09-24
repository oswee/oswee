import { createSelector } from 'reselect'
import { RootState } from '../../../reducer'

const getState = (state: RootState) => state.organizations

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace OrganizationSelectors {
  export const selected = createSelector([getState], state => state.selected)

  export const entities = createSelector([getState], state => state.entities)

  export const organizations = createSelector([getState], state => state.ids.map(uuid => state.entities[uuid]).sort())

  export const organization = createSelector([selected, entities], (selected, entities) => entities[selected])

  export const shouldFetch = createSelector(
    [organization],
    organization => organization === undefined, // && state.fetching === false
  )
}
