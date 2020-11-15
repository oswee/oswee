import { routerMiddleware, startListener } from 'redux-first-routing'
import { history } from './history'
import { Store } from 'redux'

export const HistoryMiddleware = routerMiddleware(history)

export const startRouting = (store: Store) => startListener(history, store)
