import { html, TemplateResult } from 'lit-element'
import { ViewErrorElement } from './component'

export default function template(this: ViewErrorElement): TemplateResult {
  return html` <slot></slot> `
}
