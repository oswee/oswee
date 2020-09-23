import { html, TemplateResult } from 'lit-element'
import { ModShellElement } from './component'

export default function template(this: ModShellElement): TemplateResult {
  return html` <slot></slot> `
}
