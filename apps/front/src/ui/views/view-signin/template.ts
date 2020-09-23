import { html, TemplateResult } from 'lit-element'
import { ViewSignInElement } from './component'
import '../../components/sign-in'

export default function template(this: ViewSignInElement): TemplateResult {
  return html` <sign-in></sign-in> `
}
