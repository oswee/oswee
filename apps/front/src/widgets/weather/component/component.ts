import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'

import { connect } from '@oswee/libs/connect'
import { store } from '../../../store'
import template from './template'
import style from './style'

import { getWeatherModule } from '../redux/weather-module'

@customElement('weather-com')
export class WeatherComElement extends connect(store, LitElement) {
  @property({ type: Boolean }) loading: boolean
  @property() name: any
  @property() temperature: number
  @property() description: any

  constructor() {
    super()
    console.log('Constructor hit!')
    store.addModule(getWeatherModule())
  }

  mapState(state) {
    if (!state.weatherState || !state.weatherState.weather) {
      return {
        loading: true,
      }
    }
    return {
      loading: false,
      name: state.weatherState.weather.name,
      temperature: Math.round(state.weatherState.weather.main.temp - 273),
      description: state.weatherState.weather.weather[0].description,
    }
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
