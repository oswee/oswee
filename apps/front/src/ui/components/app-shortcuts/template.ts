import { html, TemplateResult } from 'lit-element'
import { AppShortcutsElement } from './component'
import { repeat } from 'lit-html/directives/repeat'
import { Icon } from '../../../assets/svg'

export default function template(this: AppShortcutsElement): TemplateResult {
  return html`
    <div class="icon">
      <a class="btn icon-btn btn--xl" href="/"> ${Icon('arrow-left', 'Back', 'icon-btn__icon')} </a>
    </div>
    ${repeat(
      this.modules.order,
      key => html`
        <div class="icon">
          <button class="btn icon-btn btn--xl" title="${this.modules.entities[key].name}">
            ${Icon(this.modules.entities[key].icon, this.modules.entities[key].name, 'icon-btn__icon')}
          </button>
        </div>
      `,
    )}
  `
}
