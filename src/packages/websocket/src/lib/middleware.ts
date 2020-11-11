import { WebsocketTypes } from './constants'
import { WebsocketActions, WebsocketActionsUnion } from './actions'

let websocket: WebSocket = null

export const WebsocketMiddleware = ({ dispatch }) => (next: any) => {
  return (action: WebsocketActionsUnion) => {
    switch (action.type) {
      case WebsocketTypes.CONNECT:
        if (websocket !== null) {
          websocket.close()
        }
        websocket = new WebSocket(action.payload.url)
        websocket.onopen = (): void =>
          dispatch(WebsocketActions.websocketConnected())
        break
      case WebsocketTypes.CONNECTED:
        websocket.onerror = (error): void => console.log(`WS Erros: ${error} `)
        websocket.onclose = (): void =>
          dispatch(WebsocketActions.websocketDisconnected())
        break
      default:
        break
    }
    next(action)
  }
}
