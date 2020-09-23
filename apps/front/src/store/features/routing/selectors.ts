import { createSelector } from 'reselect'
import { RootState } from '../../reducer'

const getState = (state: RootState) => state.route

//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace RoutingSelectors {
  export const current = createSelector([getState], state => state)

  export const pathname = createSelector([getState], state => state.pathname)
}
