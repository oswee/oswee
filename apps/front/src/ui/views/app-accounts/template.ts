import { html, TemplateResult } from 'lit-element'
import { UiComponentElement } from './component'

export default function template(this: UiComponentElement): TemplateResult {
  return html` <slot></slot> `
}
