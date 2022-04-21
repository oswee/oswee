import routingReducer from './reducer'
import { routingSaga, clickListener } from './sagas'
// import * as effects from 'redux-saga/effects'
import { ISagaModule } from 'redux-dynamic-modules-saga'
import { IRoutingRootState } from './contracts'

export const RoutingModule: ISagaModule<IRoutingRootState> = {
  // Unique id of the module
  id: 'routing',
  // Maps the Store key to the reducer
  reducerMap: {
    routingState: routingReducer,
  } as any,
  // initialActions: [SettingActions.loadPreferences()],
  // This module uses redux-saga middleware
  // This property will be be used by the SagaExtension
  // to run sagas for the moduleD
  sagas: [routingSaga, clickListener],
}
