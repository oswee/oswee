import { combineReducers, createStore, applyMiddleware, Reducer } from 'redux'
import createSagaMiddleware, { Saga } from 'redux-saga'
import { composeWithDevTools } from 'redux-devtools-extension'
import { reducerRegistry } from './reducerRegistry'
import { sagaRegistry } from './sagaRegistry'

const sagaMiddleware = createSagaMiddleware()

export const store: any = createStore(state => state, composeWithDevTools(applyMiddleware(sagaMiddleware)))

reducerRegistry.setChangeListener((reducers: { [name: string]: Reducer }) => {
  store.replaceReducer(combineReducers(reducers))
})

sagaRegistry.setChangeListener((saga: Saga) => {
  sagaMiddleware.run(saga)
})
