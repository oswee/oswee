import { html, TemplateResult } from 'lit-element'
import { AppShellElement } from './component'
import '@oswee/elements/avatar'

import('../../../../widgets/weather/index')
// import('../../../../widgets/hacker-news/index')

export default function template(this: AppShellElement): TemplateResult {
  return html` <div className="App">
    <ui-avatar text="Xz"></ui-avatar>
    <h1>Widgets</h1>
    <div className="checkboxes">
      <input type="checkbox" @change="${this.onHackerNewsToggled}" />
      <label>Hacker News</label>
      <input type="checkbox" @change="${this.onWeatherToggled}" />
      <label>Weather</label>
    </div>
    ${this.weather ? html`<weather-com></weather-com>` : html`<div>Loading Scripts...</div>`}
    <!-- ${this.hackerNews ? html`<hacker-news></hacker-news>` : html`<div>Loading Scripts...</div>`} -->
  </div>`
}
