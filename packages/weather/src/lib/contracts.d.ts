import { StringMap } from '@oswee/libs/action'

export interface IWeatherAwareState {
  weatherState: IWeatherState
}

export interface IWeatherState {
  weather: {
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
