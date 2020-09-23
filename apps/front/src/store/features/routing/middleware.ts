import { routerMiddleware, startListener } from '../../../utils/router'
import { history } from './history'
import { Store } from 'redux'

export const historyMiddleware = routerMiddleware(history)

export const startRouting = (store: Store) => startListener(history, store)
