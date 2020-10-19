import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
import { getSagaExtension } from 'redux-dynamic-modules-saga'

export const store: IModuleStore<any> = createStore({ extensions: [getSagaExtension()] })
