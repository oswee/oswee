import { html, TemplateResult } from 'lit-element'
import { UiTaskbarComponent } from './component'

export default function template(this: UiTaskbarComponent): TemplateResult {
  return html` <slot></slot> `
}
