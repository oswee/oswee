import { createSelector } from 'reselect'
// import {RootState} from 'oswee/apps/front/src/store/src/lib/reducer'
// import {RootState} from 'oswee/apps/front/src/store/src/types'
import { RootState } from 'Types'
import { IState } from './reducer'

const getState = (state: RootState): IState => state.websocket

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace Selectors {
  export const state = createSelector([getState], state => state.state)
  export const selectConnectedState = createSelector([getState], state => state.connected)
}
