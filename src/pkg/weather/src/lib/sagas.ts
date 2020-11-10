import * as effects from 'redux-saga/effects'
import { WeatherActions } from './actions'
import { WeatherTypes } from './constants'
import { fetchWeather } from './api'

function* workerSaga() {
  try {
    const data = yield effects.call(fetchWeather)
    console.log('Data:', data)
    yield effects.put(WeatherActions.weatherLoaded(data))
  } catch (error) {
    console.log('Error in the worker saga:', error.toString())
  }
}

function* watcherSaga() {
  yield effects.call(workerSaga)
}

export { watcherSaga }
