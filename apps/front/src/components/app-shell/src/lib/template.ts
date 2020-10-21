import { html, TemplateResult } from 'lit-element'
import { AppShellElement } from './component'
import '../../../order/src'

export default function template(this: AppShellElement): TemplateResult {
  return html` <dynamic-order></dynamic-order> `
}
