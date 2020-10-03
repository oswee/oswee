import { html, TemplateResult } from 'lit-element'
import { AppNavigationElement } from './component'
import { repeat } from 'lit-html/directives/repeat'

export default function template(this: AppNavigationElement): TemplateResult {
  return html`
    ${this.isApplicationsFetching && this.isModulesFetching
      ? html` <p>loading</p> `
      : html`
          ${repeat(
            this.modules,
            module => module.id,
            module => html`
              <div>
                <a href="${this.pathname}/${module.permalink}"><p>${module.title}</p></a>
              </div>
            `,
          )}
        `}
  `
}
