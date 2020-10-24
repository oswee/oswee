import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'

import { connect } from '@oswee/libs/connect'
import { store } from '../../../store/index'
import template from './template'
import style from './style'

// Redux dynamic module
import { getWeatherModule } from '@oswee/packages/weather'

@customElement('weather-com')
export class WeatherComElement extends connect(store, LitElement) {
  @property({ type: Boolean }) loading: boolean
  @property() name: any
  @property() temperature: number
  @property() description: any

  // constructor() {
  //   super()
  //   console.log('Constructor hit!')
  //   // store.addModule(getWeatherModule())
  // }

  mapState(state) {
    if (!state.weatherState || !state.weatherState.weather) {
      return {
        loading: true,
      }
    }
    return {
      loading: false, // Why this?
      name: state.weatherState.weather.name,
      temperature: Math.round(state.weatherState.weather.main.temp - 273),
      description: state.weatherState.weather.weather[0].description,
    }
  }

  connectedCallback() {
    super.connectedCallback()
    // Inject the redux module when component gets mounted
    store.addModule(getWeatherModule())
  }

  disconnectedCallback() {
    super.disconnectedCallback()
    // Reject the redux module when component gets unmounted
    store.dispose()
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
