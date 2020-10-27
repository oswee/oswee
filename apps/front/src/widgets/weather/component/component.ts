import {
  LitElement,
  customElement,
  property,
  TemplateResult,
  CSSResultArray,
} from 'lit-element'

import { connect } from '@oswee/libs/connect'
import { store } from '../../../store/index'
import template from './template'
import style from './style'

// Redux dynamic module
import {
  WeatherModule,
  WeatherSelectors,
  IWeatherAwareState,
} from '@oswee/packages/weather'

@customElement('weather-com')
export class WeatherComElement extends connect(store, LitElement) {
  @property({ type: Boolean }) loading: boolean = true
  @property({ type: String }) name: string = ''
  @property({ type: Number }) temperature: number = 0
  @property({ type: String }) description: string = ''

  // constructor() {
  //   super()
  //   console.log('Constructor hit!')
  //   store.addModule(getWeatherModule())
  // }

  connectedCallback() {
    super.connectedCallback()
    // Inject the redux module when component gets mounted
    store.addModules([WeatherModule])
    // store.dispatch(WeatherActions.weatherLoaded({}))
    // console.log('Redux mounted')
  }

  mapState(state: IWeatherAwareState) {
    if (
      !WeatherSelectors.selectState(state) ||
      !WeatherSelectors.selectWeather(state)
    ) {
      return {
        loading: true,
      }
    }
    return {
      loading: false,
      name: WeatherSelectors.selectName(state),
      temperature: Math.round(WeatherSelectors.selectTemperature(state) - 273),
      description: WeatherSelectors.selectDescription(state),
    }
  }

  // updated() {
  //   console.log('Updated:', this.name)
  // }

  disconnectedCallback() {
    super.disconnectedCallback()
    // store.dispose() //  Removes ALL of the modules added to the store and dispose of the object
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
