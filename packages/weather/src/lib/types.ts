import { WeatherTypes } from './constants'

export interface WeatherLoaded {
  readonly type: WeatherTypes.LOADED
  readonly payload: any
}

export type WeatherActionTypes = WeatherLoaded
