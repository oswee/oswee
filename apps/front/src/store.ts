import { createStore, IModuleStore } from 'redux-dynamic-modules'
import { getSagaExtension } from 'redux-dynamic-modules-saga'

export const store: IModuleStore<any> = createStore({ extensions: [getSagaExtension()] })
