import logger from 'redux-logger'
import { storageMiddleware } from './storage'
import { historyMiddleware } from './src/features/routing/middleware'
import websocketMiddleware from './src/features/websocket/middleware'
import { sagaMiddleware } from './sagas'

export const middleware = [storageMiddleware, websocketMiddleware, historyMiddleware, sagaMiddleware]
