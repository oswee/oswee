import { html, TemplateResult } from 'lit-element'
import { UiToolbarElement } from './component'

export default function template(this: UiToolbarElement): TemplateResult {
  return html` <slot></slot> `
}
