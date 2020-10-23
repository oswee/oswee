import { html, TemplateResult } from 'lit-element'
import { AppShellElement } from './component'
import '../../../order/src'
import('../../../../widgets/weather/index')

export default function template(this: AppShellElement): TemplateResult {
  return html` <div className="App">
    <h1>Widgets</h1>
    <div className="checkboxes">
      <input type="checkbox" @change="${this.onHackerNewsToggled}" />
      <label>Hacker News</label>
      <input type="checkbox" @change="${this.onWeatherToggled}" />
      <label>Weather</label>
    </div>
    ${this.weather ? html`<weather-com></weather-com>` : html`<div>Loading Scripts...</div>`}
  </div>`
}
