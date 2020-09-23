import { html, TemplateResult } from 'lit-element'
import { LauncherAccountElement } from './component'

export default function template(this: LauncherAccountElement): TemplateResult {
  return html`
    <p>Hello from ${this.name}</p>
    <button class="btn" @click=${this.onButtonClick}>Select me</button>
  `
}
