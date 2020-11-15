import { WebsocketTypes } from './constants'
import { WebsocketActions, WebsocketActionsUnion } from './actions'

let websocket: WebSocket = null

export const WebsocketMiddleware = ({ dispatch }) => (next: any) => {
  return (action: WebsocketActionsUnion) => {
    switch (action.type) {
      case WebsocketTypes.CONNECT:
        if (websocket !== null) {
          // What if we want to handle multiple connections?
          websocket.close()
        }
        websocket = new WebSocket(action.payload.url)
        websocket.onopen = (): void =>
          dispatch(WebsocketActions.websocketConnected())
        break
      case WebsocketTypes.CONNECTED:
        websocket.onmessage = (event): void => {
          console.log(event)
        }
        websocket.onerror = (error): void => console.log(`WS Error: ${error} `)
        websocket.onclose = (): void =>
          dispatch(WebsocketActions.websocketDisconnected())
        break
      case WebsocketTypes.DISCONNECT:
        if (websocket !== null) {
          websocket.close()
        }
        websocket = null
        break
      case WebsocketTypes.DISCONNECTED:
        break
      default:
        break
    }
    next(action)
  }
}
