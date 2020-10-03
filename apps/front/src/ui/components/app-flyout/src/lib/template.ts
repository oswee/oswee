import { html, TemplateResult } from 'lit-element'
import { AppFlyoutElement } from './component'
import { repeat } from 'lit-html/directives/repeat'

export default function template(this: AppFlyoutElement): TemplateResult {
  return html`
    ${repeat(
      this.modules,
      module => module.id,
      module => html`
        <div>
          <a href=${module.id}><p>${module.title}</p></a>
        </div>
      `,
    )}
  `
}
