import { html, TemplateResult } from 'lit-element'
import { AppTaskbarElement } from './component'
import { Icon } from '../../../assets/svg'

export default function template(this: AppTaskbarElement): TemplateResult {
  return html`
    <div class="left">
      <div class="launcher">
        <button
          class="btn icon-btn btn--xl"
          @click="${this.displayLauncher}"
          id="launcher"
          title="Launcher"
          aria-label="Open launcher"
        >
          ${Icon('apps', 'Launcher', 'icon-btn__icon')}
        </button>
      </div>
    </div>
    <h1>Home</h1>
    <div class="middle">
      <div class="fieldset">
        <input name="search" type="search" />
      </div>
    </div>
    <div class="right">
      <button class="btn icon-btn btn--xl" @click=${this.toggleActionCenter} title="Action Center">
        ${Icon('gear', '', 'icon-btn__icon')}
      </button>
      <button class="btn btn--lg" @click=${this.switchTheme}>
        <span>Theme</span>
      </button>
    </div>
  `
}
