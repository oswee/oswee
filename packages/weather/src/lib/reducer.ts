import produce from 'immer'
import { WeatherLoaded } from './actions'
// import { WeatherState } from './models'

export const weatherReducer = (state, action) => {
  return produce(state || {}, draft => {
    switch (action.type) {
      case WeatherLoaded: {
        draft.weather = action.payload
        break
      }

      default: {
        //do nothing
      }
    }
  })
}
