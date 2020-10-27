// import produce from 'immer'
import { WeatherTypes } from './constants'
import { WeatherActionTypes } from './types'
import { IWeatherState } from './contracts'

const initialState: IWeatherState = {
  weather: {
    weather: [
      {
        description: '',
      },
    ],
    main: {
      temp: undefined,
    },
    name: '',
  },
}

export const weatherReducer = (
  state: IWeatherState = initialState,
  action: WeatherActionTypes,
): IWeatherState => {
  switch (action.type) {
    case WeatherTypes.LOADED: {
      console.log('Reducer:', action.payload)
      return {
        ...state,
        weather: action.payload,
      }
    }

    default:
      return state
  }
}
