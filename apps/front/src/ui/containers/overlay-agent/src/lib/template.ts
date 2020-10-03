import { html, TemplateResult } from 'lit-element'

export default function template(): TemplateResult {
  return html`
    <slot name="launcher"></slot>
    <slot name="popup"></slot>
    <slot name="dialog"></slot>
  `
}
