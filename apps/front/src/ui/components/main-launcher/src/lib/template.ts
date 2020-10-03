import { html, TemplateResult } from 'lit-element'
import { MainLauncherElement } from './component'
import { repeat } from 'lit-html/directives/repeat'
// import { Icon } from '../../../assets/svg'
import '../../components/nav-item'
import '../../components/nav-item-title'
// import '../../components/app-flyout'
import '../../components/sign-in'
import '../../components/sign-up'
// import '../../elements/ui-launcher'
import '../../elements/ui-avatar'

export default function template(this: MainLauncherElement): TemplateResult {
  switch (this.activeView) {
    case 'signup':
      return html` <sign-up noshadow></sign-up> `
    case 'signin':
      return html` <sign-in noshadow></sign-in> `
    default:
      return html`
        <div class="account">
          <ui-avatar src="src/assets/img/avatars/me-48.png" alt="Dzintars Klavins"></ui-avatar>
          <div class="credentials">
            <p class="username">Guest</p>
            <p class="account-type">Public account</p>
          </div>
          <button class="btn btn--md btn--secondary" @click="${this.onSignIn}">Sign In</button>
        </div>
        <nav>
          ${repeat(
            this.applications,
            app => app.id,
            app => html`
              <nav-item .key="${app.id}" .label="${app.title}" .permalink="${app.permalink}">
                <nav-item-title .key="${app.id}" .label="${app.title}"></nav-item-title>
                ${app.modules
                  ? html`
                      <p>+</p>
                      <!-- ${this.activeNavItem === `${app.id}`
                        ? html` <app-flyout .key="${app.id}" noshadow></app-flyout> `
                        : html``} -->
                    `
                  : html` <p></p> `}
              </nav-item>
            `,
          )}
        </nav>
      `
  }
}
