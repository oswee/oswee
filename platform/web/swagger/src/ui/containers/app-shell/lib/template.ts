import { html, TemplateResult } from 'lit'
import { AppShellElement } from './component'

export default function template(this: AppShellElement): TemplateResult {
  return html` <p>Hello from ${this.name}</p> `
}
