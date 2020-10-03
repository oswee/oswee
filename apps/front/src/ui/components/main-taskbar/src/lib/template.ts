import { html, TemplateResult } from 'lit-element'
import { MainTaskbarElement } from './component'
import { repeat } from 'lit-html/directives/repeat'
import { Icon } from '../../../assets/svg'
import '../../elements/ui-taskbar'

export default function template(this: MainTaskbarElement): TemplateResult {
  return html`
    <ui-taskbar>
      <nav>
        <div class="main-area">
          <button class="btn btn--lg" @click="${this.displayLauncher}" id="launcher" title="Open Launcher">
            ${Icon('grid', '', 'icon-btn__icon')}
          </button>
          <ul>
            <li>Home</li>
            <li>Solutions</li>
            <li>Support</li>
            <li>Resources</li>
            <li>About Us</li>
          </ul>
        </div>
        <div class="actions">
          <button class="btn" title="Applications" @click=${this.toggleAccountWidget}>
            ${Icon('apps', 'icon-btn__icon')}
          </button>
          <button class="btn" title="Sign In" @click=${this.toggleAccountWidget}>
            ${Icon('user', '', 'icon-btn__icon')}
          </button>
        </div>
      </nav>
    </ui-taskbar>
    <button @click="${this.displayLauncher}" id="launcher" class="launcher" title="Open Launcher">
      ${Icon('apps', '', 'icon-btn__icon')}
    </button>
    <ul>
      ${repeat(
        this.applications,
        app => app.id,
        app => html` <li><a href=${app.permalink}>${app.title}</a></li> `,
      )}
    </ul>
  `
}
