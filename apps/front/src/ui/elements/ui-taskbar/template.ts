import { html, TemplateResult } from 'lit-element'
import { UiTaskbarElement } from './component'

export default function template(this: UiTaskbarElement): TemplateResult {
  return html` <slot></slot> `
}
