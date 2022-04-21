import { html, TemplateResult } from 'lit'
import { UiTaskbarComponent } from './component'

export default function template(this: UiTaskbarComponent): TemplateResult {
  return html` <slot></slot> `
}
