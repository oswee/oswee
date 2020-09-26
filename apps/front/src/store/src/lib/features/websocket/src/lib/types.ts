import { Types } from './constants'

interface Connect {
  readonly type: Types.CONNECT
  readonly payload: {
    url: string
  }
}

interface Connecting {
  readonly type: Types.CONNECTING
}

interface Connected {
  readonly type: Types.CONNECTED
}

interface Send {
  readonly type: Types.SEND
  readonly payload: {
    type: string
    payload?: object
  }
}

interface SendRpc {
  readonly type: Types.SEND_RPC
  readonly payload: {
    service: string
    rpc: string
    message?: object
  }
}

interface Disconnect {
  readonly type: Types.DISCONNECT
}

interface Disconnected {
  readonly type: Types.DISCONNECTED
}

interface Error {
  readonly type: Types.ERROR
  readonly payload: {
    error: string
    message: string
  }
}

export type ActionTypes = Connect | Connecting | Connected | Send | SendRpc | Disconnect | Disconnected | Error
