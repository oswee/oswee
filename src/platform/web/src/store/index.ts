// import { offline } from '@redux-offline/redux-offline'
// import offlineConfig from '@redux-offline/redux-offline/lib/defaults'
import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
import { getSagaExtension } from 'redux-dynamic-modules-saga'
import { WebsocketMiddleware } from '@oswee/pkg/websocket'
import { applyMiddleware } from 'redux'

export const store: IModuleStore<any> = createStore({
  // enhancers: [offline(offlineConfig)],
  enhancers: [applyMiddleware(WebsocketMiddleware)],
  extensions: [getSagaExtension()],
})
