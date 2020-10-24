import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('app-shell')
// export class AppShellElement extends connect(store, LitElement) {
export class AppShellElement extends LitElement {
  @property({ type: Boolean }) hackerNews = false
  @property({ type: Boolean }) weather = false

  onHackerNewsToggled = () => {
    console.log('News click:')
    this.hackerNews = !this.hackerNews
  }

  onWeatherToggled = () => {
    console.log('Weather click:')
    this.weather = !this.weather
  }

  // getWeather() {
  //   if (!this.weather) {
  //     return null
  //   }
  //   import('../../../../widgets/weather/index')
  // }

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
