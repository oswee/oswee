import { html, TemplateResult } from 'lit-element'
import { ViewHomeElement } from './component'
import '../../containers/app-navigation-connected'
import '../../components/app-navigation'

export default function template(this: ViewHomeElement): TemplateResult {
  return html`
    <app-taskbar noshadow></app-taskbar>
    <app-navigation noshadow></app-navigation>
  `
}
