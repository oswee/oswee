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
        weather: {
          state: WebsocketTypes.CONNECTING,
        },
      }
    }
    default:
      return state
  }
}
