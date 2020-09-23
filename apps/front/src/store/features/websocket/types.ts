export enum WebsocketTypes {
  CONNECT = 'WEBSOCKET__CONNECT',
  CONNECTING = 'WEBSOCKET__CONNECTING',
  CONNECTED = 'WEBSOCKET__CONNECTED',
  SEND = 'WEBSOCKET__SEND',
  SEND_RPC = 'WEBSOCKET__SEND_RPC',
  DISCONNECT = 'WEBSOCKET__DISCONNECT',
  DISCONNECTED = 'WEBSOCKET__DISCONNECTED',
  ERROR = 'WEBSOCKET__ERROR',
}

interface Connect {
  readonly type: WebsocketTypes.CONNECT
  readonly payload: {
    url: string
  }
}
interface Connecting {
  readonly type: WebsocketTypes.CONNECTING
}
interface Connected {
  readonly type: WebsocketTypes.CONNECTED
}
interface Send {
  readonly type: WebsocketTypes.SEND
  readonly payload: {
    type: string
    payload?: object
  }
}
interface SendRpc {
  readonly type: WebsocketTypes.SEND_RPC
  readonly payload: {
    service: string
    rpc: string
    message?: object
  }
}
interface Disconnect {
  readonly type: WebsocketTypes.DISCONNECT
}
interface Disconnected {
  readonly type: WebsocketTypes.DISCONNECTED
}
interface Error {
  readonly type: WebsocketTypes.ERROR
  readonly payload: {
    error: string
    message: string
  }
}

export type WebsocketActionTypes = Connect | Connecting | Connected | Send | SendRpc | Disconnect | Disconnected | Error
