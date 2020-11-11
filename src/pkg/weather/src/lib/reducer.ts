import produce from 'immer'
import { WeatherTypes } from './constants'
import { WeatherActionTypes } from './types'
import { IWeatherState } from './contracts'
import { WeatherActionsUnion } from './actions'

const initialState: IWeatherState = {
  weather: {
    weather: [
      {
        description: '',
      },
    ],
    main: {
      temp: 0,
    },
    name: 'Antarctica',
  },
}

// const initialState = {
//   weather: [
//     {
//       description: '',
//     },
//   ],
//   main: {
//     temp: 0,
//   },
//   name: 'Antarctica',
// }

export const weatherReducer = (
  state: IWeatherState = initialState,
  action: WeatherActionsUnion,
) => {
  switch (action.type) {
    case WeatherTypes.LOADED: {
      console.log(action)
      return {
        ...state,
        weather: action.payload,
      }
    }

    default:
      return state
  }
}

// export function weatherReducer(
//   state: IWeatherState,
//   action: WeatherActionsUnion,
// ): IWeatherState {
//   return produce(state || initialState, (draft: IWeatherState) => {
//     switch (action.type) {
//       case WeatherTypes.LOADED: {
//         const { weather } = action.payload
//         for (const key in weather) {
//           /*eslint no-prototype-builtins: "off"*/
//           if (weather.hasOwnProperty(key)) {
//             draft.weather[key] = weather[key]
//           }
//         }
//         break
//       }
//     }
//   })
// }
