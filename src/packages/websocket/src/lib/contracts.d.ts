import { StringMap } from '@oswee/lib/action'
import { WebsocketTypes } from './constants'

export interface IWebsocketRootState {
  readonly websocketState: IWebsocketState
}

export interface IWebsocketState {
  readonly websocket: {
    readonly state: WebsocketTypes
  }
}

export interface IConnectPayload {
  url: string
}
