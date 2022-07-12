import { LitElement, TemplateResult, CSSResultArray } from 'lit'
import { customElement, property } from 'lit/decorators.js'
import template from './template'
import style from './style'

@customElement('app-shell')
export class AppShellElement extends LitElement {
  @property({ type: Boolean, reflect: true }) selected = false
  @property({ type: Number }) key = 0
  @property({ type: String }) name = 'Component'

  protected render(): TemplateResult {
    return template.call(this)
  }

  static get styles(): CSSResultArray {
    return [style]
  }

  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'app-shell': AppShellElement
  }
}

export interface ComponentData {
  key: number
  name: string
}
