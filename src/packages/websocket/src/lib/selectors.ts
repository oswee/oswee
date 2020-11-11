import * as reselect from 'reselect'
import { WebsocketTypes } from './constants'
import { IWebsocketRootState, IWebsocketState } from './contracts'

// INPUT/BASE SELECTORS
/**
 *
 * @param state Takes RootState as an argument
 */
const getState = (state): IWebsocketRootState => state

// MEMOIZED SELECTORS

/**
 * Whats the point of using memoizaton of i have no any arguments there?
 */
const selectState = reselect.createSelector([getState], state => {
  console.log('SelectState:', state)
  return state.websocketState
})

const selectWebsocket = reselect.createSelector([selectState], state => {
  console.log('SelectWebsocket:', state)
  return state.websocket
})

const selectConnectionState = reselect.createSelector(
  [selectWebsocket],
  (state): WebsocketTypes => {
    return state.state
  },
)

export const WebsocketSelectors = {
  selectState,
  selectWebsocket,
  selectConnectionState,
}
