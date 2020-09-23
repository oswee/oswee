import { html, TemplateResult } from 'lit-element'
import { ViewNotFoundElement } from './component'
import '../../containers/app-taskbar'

export default function template(this: ViewNotFoundElement): TemplateResult {
  return html`
    <app-taskbar noshadow></app-taskbar>
    <h1>Not Found</h1>
  `
}
