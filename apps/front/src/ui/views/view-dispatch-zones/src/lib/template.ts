import { html, TemplateResult } from 'lit-element'
import { ViewDispatchZonesElement } from './component'

export default function template(this: ViewDispatchZonesElement): TemplateResult {
  return html` ${this.parentTemplate} `
}
