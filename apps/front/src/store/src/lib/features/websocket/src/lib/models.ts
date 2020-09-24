import { WebsocketTypes } from './types'

export interface WebsocketState {
  readonly state: WebsocketTypes
  readonly connected: boolean
}
