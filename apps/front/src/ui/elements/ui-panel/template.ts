import { html, TemplateResult } from 'lit-element'
import { UiPanelElement } from './component'

export default function template(this: UiPanelElement): TemplateResult {
  return html` <slot></slot> `
}
