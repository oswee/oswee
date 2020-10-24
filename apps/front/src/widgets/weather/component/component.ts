import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'

import { connect } from '@oswee/libs/connect'
import { store } from '../../../store/index'
import template from './template'
import style from './style'

// Redux dynamic module
import { getWeatherModule, WeatherSelectors } from '@oswee/packages/weather'

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

  connectedCallback() {
    super.connectedCallback()
    // Inject the redux module when component gets mounted
    store.addModule(getWeatherModule())
  }

  mapState(state) {
    if (!WeatherSelectors.selectState(state) || !WeatherSelectors.selectWeather(state)) {
      return {
        loading: true,
      }
    }
    return {
      name: state.weatherState.weather.name,
      temperature: Math.round(state.weatherState.weather.main.temp - 273),
      description: state.weatherState.weather.weather[0].description,
    }
  }

  _weather = null
  // getWeather() {
  //   if (!this.state.weather) {
  //     return null
  //   }
  //   if (this._weather) {
  //     return this._weather
  //   }

  //   const LoadableWeather = Loadable({
  //     loader: () => import('./widgets/weather'),
  //     loading: () => <div>Loading Scripts...</div>,
  //   })
  //   this._weather = <LoadableWeather />
  //   return this._weather
  // }

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
