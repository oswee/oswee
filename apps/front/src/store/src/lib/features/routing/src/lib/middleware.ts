import { routerMiddleware, startListener } from 'oswee/libs/router/src/index'
import { history } from './history'
import { Store } from 'redux'

export const historyMiddleware = routerMiddleware(history)

export const startRouting = (store: Store) => startListener(history, store)
