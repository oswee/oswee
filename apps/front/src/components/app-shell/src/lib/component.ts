import {
  LitElement,
  customElement,
  property,
  TemplateResult,
  CSSResultArray,
  html,
} from 'lit-element'
import template from './template'
import style from './style'

@customElement('app-shell')
// export class AppShellElement extends connect(store, LitElement) {
export class AppShellElement extends LitElement {
  @property({ type: Object }) state: {
    hackerNews: boolean
    weather: boolean
  }

  constructor() {
    super()

    // define the initial state where none of the widgets are visible
    this.state = {
      hackerNews: false,
      weather: false,
    }
  }

  connectedCallback() {
    super.connectedCallback()
    import('../../../../widgets/weather')
  }

  onHackerNewsToggled = () => {
    this.state.hackerNews = !this.state.hackerNews
  }

  onWeatherToggled = () => {
    this.state.weather = !this.state.weather
    this.requestUpdate()
  }

  renderContent = () => {
    return (
      // this.getHackerNews()
      this.getWeather()
    )
  }

  _weather = null
  getWeather() {
    // console.log('getWeather click', this._weather)
    // if (!this.state.weather) {
    //   return null
    // }
    // if (this._weather) {
    //   return this._weather
    // }

    // import('../../../../widgets/weather')
    // const LoadableWeather = Loadable({
    //   loader: () => import('./widgets/weather'),
    //   loading: () => <div>Loading Scripts...</div>,
    // })

    // this._weather = <LoadableWeather />
    // import('../../../../widgets/weather')
    // this._weather = html`<div>Loading Weather...</div>`
    this._weather = this.state.weather
      ? html`<weather-com></weather-com>`
      : html`<div>Loading Scripts...</div>`
    return this._weather
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}
