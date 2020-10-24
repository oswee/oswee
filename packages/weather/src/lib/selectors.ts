import * as reselect from 'reselect'
import { WeatherState } from './models'

// INPUT/BASE SELECTORS
const getState = (state: WeatherState): WeatherState => state

// MEMOIZED SELECTORS
const selectState = reselect.createSelector([getState], state => state)
const selectWeather = reselect.createSelector([selectState], state => state)

export const WeatherSelectors = {
  selectState,
  selectWeather,
}
