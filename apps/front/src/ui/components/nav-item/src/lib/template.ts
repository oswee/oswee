import { html, TemplateResult } from 'lit-element'
import { NavItemElement } from './component'

export default function template(this: NavItemElement): TemplateResult {
  return html` <slot></slot> `
}
