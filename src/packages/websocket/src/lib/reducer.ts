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
          state: action.type,
        },
      }
    }
    case WebsocketTypes.CONNECTING: {
      return {
        ...state,
        websocket: {
          state: action.type,
        },
      }
    }
    case WebsocketTypes.CONNECTED: {
      return {
        ...state,
        websocket: {
          state: action.type,
        },
      }
    }
    case WebsocketTypes.DISCONNECT: {
      return {
        ...state,
        websocket: {
          state: action.type,
        },
      }
    }
    case WebsocketTypes.DISCONNECTED: {
      return {
        ...state,
        websocket: {
          state: action.type,
        },
      }
    }
    default:
      return state
  }
}
