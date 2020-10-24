// import { call, put } from "redux-saga/effects";
import * as effects from 'redux-saga/effects'
import { weatherLoaded } from './actions'

export function* weatherSaga() {
  yield effects.call(loadWeatherData)
}

function* loadWeatherData() {
  const url = 'https://api.openweathermap.org/data/2.5/weather?q=Riga&APPID=1362c34423375d167d694489b1c74080'

  const response = yield effects.call(fetch, url)
  const json = yield effects.call([response, response.json])

  yield effects.put(weatherLoaded(json))
}
