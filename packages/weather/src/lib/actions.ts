import { WeatherTypes } from './constants'
import { ActionsUnion, createAction, StringMap } from '@oswee/libs/action'

export const WeatherLoaded = 'weather/weatherLoaded'

// export const weatherLoaded = (payload: WeatherState): WeatherActionTypes => {
//   return {
//     type: WeatherTypes.LOADED,
//     payload,
//   }
// }

// export const WeatherActions = {
//   weatherLoaded,
// }

export const WeatherActions = {
  weatherLoaded: (payload: StringMap<string | boolean>) =>
    createAction(WeatherTypes.LOADED, payload),
}

// we leverage TypeScript token merging, so our consumer can use `Actions` for both runtime and compile time types 💪
export type WeatherActionsUnion = ActionsUnion<typeof WeatherActions>
