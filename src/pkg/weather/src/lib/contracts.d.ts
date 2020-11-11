import { StringMap } from '@oswee/lib/action'

export interface IWeatherRootState {
  readonly weatherState: IWeatherState
}

export interface IWeatherState {
  readonly weather: {
    weather: [
      {
        description: string
      },
    ]
    main: {
      temp: number
    }
    name: string
  }
}

// export interface IWeatherState {
//   readonly weather: StringMap<string | boolean>
// }
