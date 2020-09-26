import { ActionTypes } from './types'
import { Types } from './constants'

// import {ActionWithPayload} from 'oswee/libs/action/src/index'

export const websocketConnect = (url: string): ActionTypes => ({
  type: Types.CONNECT,
  payload: {
    url,
  },
})

export const websocketConnecting = (): ActionTypes => ({
  type: Types.CONNECTING,
})

export const websocketConnected = (): ActionTypes => ({
  type: Types.CONNECTED,
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
export const websocketSend = (type: string, payload: object): ActionTypes => ({
  type: Types.SEND,
  payload: {
    type,
    payload,
  },
})

export const websocketDisconnect = (): ActionTypes => ({
  type: Types.DISCONNECT,
})

export const websocketDisconnected = (): ActionTypes => ({
  type: Types.DISCONNECTED,
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
export const sendRpc = (service: string, rpc: string, message: object): ActionTypes => ({
  type: Types.SEND_RPC,
  payload: {
    service,
    rpc,
    message,
  },
})

/**
 * TODO: Experimenting with namespaces
 */
export const Actions = {
  Connect: websocketConnect,
  Connecting: websocketConnecting,
  Connected: websocketConnected,
  Send: websocketSend,
  SendRpc: sendRpc,
  Disconnect: websocketDisconnect,
  Disconnected: websocketDisconnected,
}
