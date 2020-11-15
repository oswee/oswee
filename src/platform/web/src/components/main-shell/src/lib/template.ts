import { html, TemplateResult } from 'lit-element'
import { MainShellElement } from './component'
import '@oswee/components/ui-taskbar'
import { WebsocketTypes } from '@oswee/packages/websocket'

export default function template(this: MainShellElement): TemplateResult {
  return html`
    ${this.socketState === WebsocketTypes.CONNECTED
      ? html`
          <ui-taskbar><h1>Taskbar</h1></ui-taskbar>
          <div class="App">
            <h1>Widgets</h1>
            <div className="checkboxes">
              <input type="checkbox" @change="${this.onHackerNewsToggled}" />
              <label>Hacker News</label>
              <input type="checkbox" @change="${this.onWeatherToggled}" />
              <label>Weather</label>
              <input type="checkbox" @change="${this.onWeatherToggled}" />
              <label>Modules</label>
            </div>
            <div class="widgets">
              <div class="widgets">${this.renderContent()}</div>
            </div>
          </div>
        `
      : html`<p>${this.socketState}</p>`}
  `
}

// ${this.state.weather ? html`<weather-com></weather-com>` : html`<div>Loading Scripts...</div>`}
