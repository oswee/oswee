import { html, TemplateResult } from 'lit-element'
import '../../components/main-taskbar'

export default function template(): TemplateResult {
  return html`
    <main-taskbar></main-taskbar>
    <slot name="workspace"></slot>
  `
}
