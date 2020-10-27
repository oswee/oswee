import * as reselect from 'reselect'
import { IWeatherAwareState, IWeatherState } from './contracts'

// INPUT/BASE SELECTORS
const getState = (state: IWeatherAwareState): IWeatherAwareState => {
  // console.log('getState:', state)
  return state
}

// MEMOIZED SELECTORS
const selectState = reselect.createSelector([getState], state => {
  // console.log('selectState:', state)
  return state
})
const selectWeather = reselect.createSelector([selectState], state => {
  // console.log('selectWeather:', state.weatherState)
  return state.weatherState
})
const selectName = reselect.createSelector(
  [selectWeather],
  state => state.weather.name,
)
const selectTemperature = reselect.createSelector(
  [selectWeather],
  state => state.weather.main.temp,
)
const selectDescription = reselect.createSelector([selectWeather], state => {
  return state.weather.weather[0].description
})

export const WeatherSelectors = {
  selectState,
  selectWeather,
  selectName,
  selectTemperature,
  selectDescription,
}
