import { createSelector } from 'reselect'
import { RootState } from '../../reducer'
import { WebsocketState } from './reducer'

const getState = (state: RootState): WebsocketState => state.websocket

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace WebsocketSelectors {
  export const state = createSelector([getState], state => state.state)
  export const selectConnectedState = createSelector([getState], state => state.connected)
}
