import { weatherReducer } from './reducer'
import { watcherSaga } from './sagas'
// import * as effects from 'redux-saga/effects'
import { ISagaModule } from 'redux-dynamic-modules-saga'
import { IWeatherRootState } from './contracts'

export const WeatherModule: ISagaModule<IWeatherRootState> = {
  // Unique id of the module
  id: 'weather',
  // Maps the Store key to the reducer
  reducerMap: {
    weatherState: weatherReducer,
  } as any,
  // initialActions: [SettingActions.loadPreferences()],
  // This module uses redux-saga middleware
  // This property will be be used by the SagaExtension
  // to run sagas for the moduleD
  sagas: [watcherSaga],
}
