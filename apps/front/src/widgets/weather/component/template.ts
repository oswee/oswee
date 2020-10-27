import { html, TemplateResult } from 'lit-element'
import { WeatherComElement } from './component'

export default function template(this: WeatherComElement): TemplateResult {
  if (this.loading) {
    return html`<div className="weather-root widget">
      Loading Weather from weather component...
    </div>`
  }

  return html`
    <div className="weather-root widget">
      <h2>${this.name}</h2>
      <div>${this.description}</div>
      <div>${this.temperature} °C</div>
    </div>
  `
}
