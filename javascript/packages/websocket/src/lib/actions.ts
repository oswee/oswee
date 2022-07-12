import { WebsocketTypes } from './constants'
import { ActionsUnion, createAction } from '@oswee/modules/action'
import { IConnectPayload } from './contracts'

export const WebsocketActions = {
	websocketConnect: (payload: IConnectPayload) => createAction(WebsocketTypes.CONNECT, payload),
	websocketConnecting: () => createAction(WebsocketTypes.CONNECTING),
	websocketConnected: () => createAction(WebsocketTypes.CONNECTED),
	websocketDisconnect: () => createAction(WebsocketTypes.DISCONNECT),
	websocketDisconnected: () => createAction(WebsocketTypes.DISCONNECTED),
	websocketError: () => createAction(WebsocketTypes.ERROR),
}

export type WebsocketActionsUnion = ActionsUnion<typeof WebsocketActions>
