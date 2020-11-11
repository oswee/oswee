// import produce from 'immer'
import { WebsocketTypes } from './constants'
import { WebsocketActionsUnion } from './actions'
import { IWebsocketState } from './contracts'

const initialState: IWebsocketState = {
  websocket: {
    state: WebsocketTypes.DISCONNECTED,
  },
}

export const websocketReducer = (
  state: IWebsocketState = initialState,
  action: WebsocketActionsUnion,
) => {
  switch (action.type) {
    case WebsocketTypes.CONNECT: {
      return {
        ...state,
        websocket: {
          state: WebsocketTypes.CONNECTING,
        },
      }
    }
    case WebsocketTypes.CONNECTED: {
      return {
        ...state,
        websocket: {
          state: WebsocketTypes.CONNECTED,
        },
      }
    }
    default:
      return state
  }
}
