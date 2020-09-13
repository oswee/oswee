import { html, TemplateResult } from 'lit-element'
import { UiAvatarElement } from './component'

export default function template(this: UiAvatarElement): TemplateResult {
  // TODO: What if there is no image or text provided? ETC., Implement fallbacks.
  return html`
    ${this.text
      ? html` <p>${this.text}</p> `
      : html` <img src=${this.src} alt=${this.alt} @click=${this.onButtonClick} /> `}
  `
}
