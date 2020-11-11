import { ISagaModule } from 'redux-dynamic-modules-saga'
import { IWebsocketRootState } from './contracts'
import { websocketReducer } from './reducer'

export const WebsocketModule: ISagaModule<IWebsocketRootState> = {
  id: 'websocket',
  reducerMap: {
    websocketState: websocketReducer,
  } as any,
  sagas: [],
}
