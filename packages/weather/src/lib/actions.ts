import { WeatherTypes } from './constants'
import { ActionsUnion, createAction, StringMap } from '@oswee/libs/action'
import { IWeatherRootState, IWeatherState } from './contracts'

// export const WeatherLoaded = 'weather/weatherLoaded'

// export const weatherLoaded = (payload: WeatherState): WeatherActionTypes => {
//   return {
//     type: WeatherTypes.LOADED,
//     payload,
//   }
// }

// export const WeatherActions = {
//   weatherLoaded,
// }

// StringMap<string | boolean>

export const WeatherActions = {
  weatherLoaded: (weather: IWeatherState) =>
    createAction(WeatherTypes.LOADED, weather),
}

// we leverage TypeScript token merging, so our consumer can use `Actions` for both runtime and compile time types 💪
export type WeatherActionsUnion = ActionsUnion<typeof WeatherActions>
