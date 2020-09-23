import { html, TemplateResult } from 'lit-element'
import '../../components/main-taskbar'
import '../../containers/system-router'

export default function template(): TemplateResult {
  return html`
    <main-taskbar></main-taskbar>
    <slot name="workspace"></slot>
    <slot name="workspacex"></slot>
  `
}
