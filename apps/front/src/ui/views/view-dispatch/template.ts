import { html, TemplateResult } from 'lit-element'
import { ViewDispatchElement } from './component'
import '../../containers/app-taskbar'
import '../../components/app-navigation'
import '../../containers/app-navigation-connected'

export default function template(this: ViewDispatchElement): TemplateResult {
  return html`
    <app-taskbar noshadow></app-taskbar>
    <app-navigation .appid="${this.appid}" noshadow></app-navigation>
  `
}
