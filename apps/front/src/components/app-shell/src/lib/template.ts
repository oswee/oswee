import { html, TemplateResult } from 'lit-element'
import { AppShellElement } from './component'
import '@oswee/elements/avatar'

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
    <div class="widgets">
      <div class="widgets">${this.renderContent()}</div>
    </div>
  </div>`
}

// ${this.state.weather ? html`<weather-com></weather-com>` : html`<div>Loading Scripts...</div>`}
