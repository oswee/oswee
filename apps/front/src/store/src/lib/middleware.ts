// import logger from 'redux-logger'
import { storageMiddleware } from './storage'
import { historyMiddleware } from './features/routing/src/lib/middleware'
import websocketMiddleware from './features/websocket/src/lib/middleware'
import { sagaMiddleware } from './sagas'

export const middleware = [storageMiddleware, websocketMiddleware, historyMiddleware, sagaMiddleware]
