import * as reselect from 'reselect'
import { IWeatherRootState, IWeatherState } from './contracts'

// INPUT/BASE SELECTORS
/**
 *
 * @param state Takes RootState as an argument
 */
const getState = (state): IWeatherRootState => state

// MEMOIZED SELECTORS

/**
 * Whats the point of using memoizaton of i have no any arguments there?
 */
const selectState = reselect.createSelector([getState], state => {
	console.log('SelectState:', state)
	return state.weatherState
})

const selectWeather = reselect.createSelector([selectState], state => {
	console.log('SelectWeather:', state.weather)
	return state.weather
})

// const selectState = (state): IWeatherRootState => {
//   console.log('selectState:', state)
//   return state
// }

// const selectWeather = (state) => {
//   console.log('selectWeather:', state)
//   return state
// }

const selectName = reselect.createSelector([selectWeather], state => {
	return state.name
})

const selectTemperature = reselect.createSelector([selectWeather], state => state.main.temp)

const selectDescription = reselect.createSelector([selectWeather], state => {
	return state.weather[0].description
})

export const WeatherSelectors = {
	selectState,
	selectWeather,
	selectName,
	selectTemperature,
	selectDescription,
}
