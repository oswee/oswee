import { html, TemplateResult } from 'lit-element'
import { ActionCenterElement } from './component'
import { Icon } from '../../../assets/svg'
import '../../views/app-signup'

export default function template(this: ActionCenterElement): TemplateResult {
  return html`
    <main>
      <nav>
        <button class="btn icon-btn btn--xl" title="Accounts">${Icon('user', 'Account', 'icon-btn__icon')}</button>
        <button class="btn icon-btn btn--xl" title="Theme">${Icon('palette', 'Theme', 'icon-btn__icon')}</button>
      </nav>
      <div></div>
    </main>
  `
}
