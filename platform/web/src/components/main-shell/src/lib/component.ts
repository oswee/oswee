import { html, LitElement, TemplateResult, CSSResultArray } from 'lit'
import { customElement, property } from 'lit/decorators.js'
import { connect } from '@oswee/lib/connect'
import { store } from '@oswee/packages/store'
import {
  WebsocketActions,
  IConnectPayload,
  WebsocketModule,
  WebsocketSelectors,
  WebsocketTypes,
} from '@oswee/packages/websocket'
import { RoutingModule } from '@oswee/packages/routing'
import template from './template'
import style from './style'
import { Layout, Typography, Colors } from '@oswee/lib/shared/style'

@customElement('main-shell')
export class MainShellElement extends connect(store, LitElement) {
  // export class MainShellElement extends LitElement {
  @property({ type: Object }) state: {
    hackerNews: boolean
    weather: boolean
    modules: boolean
  }
  @property({ type: String }) socketState: string

  constructor() {
    super()

    store.addModules([WebsocketModule, RoutingModule])
    // define the initial state where none of the widgets are visible
    this.state = {
      hackerNews: false,
      weather: false,
      modules: false,
    }
    this.socketState = WebsocketTypes.DISCONNECTED
  }

  connectedCallback() {
    super.connectedCallback()
    // store.addModules([WebsocketModule])
  }

  firstUpdated() {
    import(/*webpackChunkName: "weather" */ '../../../../widgets/weather')
    // import(/*webpackChunkName: "websocket" */ '@oswee/pkg/websocket')
    const payload: IConnectPayload = {
      url: 'wss://api.oswee.com',
    }
    store.dispatch(WebsocketActions.websocketConnect(payload))
  }

  mapState(state) {
    return {
      socketState: WebsocketSelectors.selectConnectionState(state),
    }
  }

  onHackerNewsToggled = () => {
    this.state.hackerNews = !this.state.hackerNews
    this.requestUpdate()
  }

  onWeatherToggled = () => {
    this.state.weather = !this.state.weather
    this.requestUpdate()
  }

  renderContent = () => {
    return html`
      ${this.state.hackerNews ? this.getHackerNews() : ''}
      ${this.state.weather ? this.getWeather() : ''}
    `
  }

  _hackerNews = null
  getHackerNews() {
    // console.log('test', this.state.hackerNews)
    if (!this.state.hackerNews) {
      return null
    }
    if (this._hackerNews) {
      return this._hackerNews
    }
    this._hackerNews = this.state.hackerNews
      ? html`<div>Hacker News</div>`
      : html`<div>Loading Scripts...</div>`
    return this._hackerNews
  }

  _weather = null
  getWeather() {
    if (!this.state.weather) {
      return null
    }
    if (this._weather) {
      return this._weather
    }

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
    return [Layout, Typography, Colors, style]
  }
  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}
