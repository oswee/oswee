import { html, TemplateResult } from 'lit-element'
import '../../components/main-taskbar'
import '../../containers/websocket-status'

export default function template(): TemplateResult {
  return html`
    <main-taskbar></main-taskbar>
    <slot name="workspace"></slot>
    <websocket-status></websocket-status>
  `
}
