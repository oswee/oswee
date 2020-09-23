import { websocketConnected, websocketDisconnected } from './actions'
import { WebsocketTypes, WebsocketActionTypes } from './types'
import * as jspb from 'google-protobuf'

let websocket: WebSocket = null

const websocketMiddleware = ({ dispatch }) => next => {
  return (action: WebsocketActionTypes) => {
    switch (action.type) {
      case WebsocketTypes.CONNECT:
        if (websocket !== null) {
          websocket.close()
        }
        websocket = new WebSocket(action.payload.url)
        websocket.onopen = (): void => dispatch(websocketConnected())
        break
      case WebsocketTypes.CONNECTED:
        websocket.onmessage = (event): void => {
          // console.log(event.data)
          /**
           * envelope represents an raw websocket message
           */
          const payload = event.data
          const actionToDispatch = payload.onMessage(event as jspb.Message)
          const envelope = JSON.parse(event.data)
          const action = {
            type: envelope.rpc,
            payload: envelope.message,
          }
          dispatch(actionToDispatch)
        }
        websocket.onerror = (error): void => console.log(`WS Error: ${error} `)
        websocket.onclose = (): void => dispatch(websocketDisconnected())
        break
      case WebsocketTypes.SEND: {
        const message = {
          type: action.payload.type,
          payload: action.payload.payload,
        }
        console.log('WSS Message: ', message)
        websocket.send(JSON.stringify(message))
        break
      }
      /**
       * Testing RPC style message format. Eventually this action will replace
       * WebsocketTypes.SEND.
       */
      case WebsocketTypes.SEND_RPC: {
        const message = {
          service: action.payload.service,
          rpc: action.payload.rpc,
          message: action.payload.message,
        }
        // console.log('WSS Message: ', message)
        websocket.send(JSON.stringify(message))
        break
      }
      case WebsocketTypes.DISCONNECT:
        if (websocket !== null) {
          websocket.close()
        }
        websocket = null
        break
      case WebsocketTypes.DISCONNECTED:
        // TODO: Retry connection if configured
        break
      default:
        break
    }
    next(action)
  }
}

export default websocketMiddleware
