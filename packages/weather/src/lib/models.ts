export type WeatherState = Readonly<{
  weather: {
    coord: {
      lon: number
      lat: number
    }
    weather: [
      {
        id: string
        main: string
        description: string
        icon: string
      },
    ]
    base: string
    main: {
      temp: number
      feels_like: number
      temp_min: number
      temp_max: number
      pressure: number
      humidity: number
    }
    visibility: number
    wind: {
      speed: number
      deg: number
    }
    clouds: {
      all: number
    }
    dt: number
    sys: {
      type: number
      id: string
      country: string
      sunrise: number
      sunset: number
    }
    timezone: number
    id: string
    name: string
    cod: number
  }
}>
