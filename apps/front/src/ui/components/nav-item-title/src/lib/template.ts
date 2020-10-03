import { html, TemplateResult } from 'lit-element'
import { NavItemTitleElement } from './component'

export default function template(this: NavItemTitleElement): TemplateResult {
  return html` <span>${this.label}</span> `
}
