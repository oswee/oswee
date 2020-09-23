import { html, TemplateResult } from 'lit-element'
import { UiStatusbarConnectedElement } from './component'
import '../../components/ui-statusbar'
import '../../containers/websocket-status'

export default function template(this: UiStatusbarConnectedElement): TemplateResult {
  return html`
    <ui-statusbar>
      <websocket-status slot="right"></websocket-status>
    </ui-statusbar>
  `
}
