import { html, TemplateResult } from 'lit-element'
import { UiStatusbarElement } from './component'

export default function template(this: UiStatusbarElement): TemplateResult {
  return html`
    <div class="left">
      <slot name="left"></slot>
    </div>
    <div class="middle">
      <slot name="middle"></slot>
    </div>
    <div class="right">
      <slot name="right"></slot>
    </div>
  `
}
