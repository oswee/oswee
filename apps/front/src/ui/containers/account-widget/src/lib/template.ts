import { html, TemplateResult } from 'lit-element'
import '../../elements/ui-card'

export default function template(): TemplateResult {
  return html`
    <div>
      <h2>Guest</h2>
    </div>
    <div>
      <ui-card>
        <a href="/signin">SignIn</a>
      </ui-card>
    </div>
  `
}
