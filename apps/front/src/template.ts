import { html, TemplateResult } from 'lit-element'
import { SystemShellElement } from './component'
import './components/order/src'

export default function template(this: SystemShellElement): TemplateResult {
  return html` <dynamic-order></dynamic-order> `
}
