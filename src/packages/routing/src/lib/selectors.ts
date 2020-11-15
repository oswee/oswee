import * as reselect from 'reselect'
// import { RootState } from '../../reducer'

const getState = state => state.route

//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace RoutingSelectors {
  export const current = reselect.createSelector([getState], state => state)

  export const pathname = reselect.createSelector(
    [getState],
    state => state.pathname,
  )
}
