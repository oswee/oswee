import { html, TemplateResult } from 'lit-element'
import { SystemShellElement } from './component'
import '../main-launcher-connected'
import '../system-router'

export default function template(this: SystemShellElement): TemplateResult {
  return html`
    ${this.websocketState
      ? html`
          ${this.isLauncherVisible ? html` <main-launcher id="main-launcher" noshadow></main-launcher> ` : ``}
          <system-router></system-router>
        `
      : html` <h1>Connecting</h1> `}
  `
}
