import { html, TemplateResult } from 'lit-element'
import { ViewSignUpElement } from './component'
import '../../components/sign-up'

export default function template(this: ViewSignUpElement): TemplateResult {
  return html` <sign-up noshadow></sign-up> `
}
