import { WeatherTypes } from './constants'
import { IWeatherRootState, IWeatherState } from './contracts'
import { ActionsUnion, createAction, StringMap } from '@oswee/libs/action'

export interface WeatherLoaded {
  readonly type: WeatherTypes.LOADED
  // readonly payload: StringMap<string | boolean>
  readonly payload: IWeatherState
}

export type WeatherActionTypes = WeatherLoaded
