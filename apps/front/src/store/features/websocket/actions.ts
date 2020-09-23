import { WebsocketTypes, WebsocketActionTypes } from './types'
import { ActionWithPayload } from '../../actions'

export const websocketConnect = (url: string): WebsocketActionTypes => ({
  type: WebsocketTypes.CONNECT,
  payload: {
    url,
  },
})

export const websocketConnecting = (): WebsocketActionTypes => ({
  type: WebsocketTypes.CONNECTING,
})

export const websocketConnected = (): WebsocketActionTypes => ({
  type: WebsocketTypes.CONNECTED,
})

/**
 * Sends the message over websocket connection.
 *
 * @remarks
 * This is primary communication method with the API
 *
 * @param type - RPC method name
 * @param payload - Message payload
 * @returns Does not return anything
 */
export const websocketSend = (type: string, payload: object): WebsocketActionTypes => ({
  type: WebsocketTypes.SEND,
  payload: {
    type,
    payload,
  },
})

export const websocketDisconnect = (): WebsocketActionTypes => ({
  type: WebsocketTypes.DISCONNECT,
})

export const websocketDisconnected = (): WebsocketActionTypes => ({
  type: WebsocketTypes.DISCONNECTED,
})

/**
 * Sends the message over websocket connection.
 *
 * @remarks
 * This is primary communication method with the API
 *
 * @param service - RPC service name
 * @param rpc - RPC method name
 * @param message - Message payload
 * @returns Does not return anything
 */
export const sendRpc = (service: string, rpc: string, message: object): WebsocketActionTypes => ({
  type: WebsocketTypes.SEND_RPC,
  payload: {
    service,
    rpc,
    message,
  },
})

/**
 * TODO: Experimenting with namespaces
 */
export const WebsocketActions = {
  Connect: websocketConnect,
  Connecting: websocketConnecting,
  Connected: websocketConnected,
  Send: websocketSend,
  SendRpc: sendRpc,
  Disconnect: websocketDisconnect,
  Disconnected: websocketDisconnected,
}
