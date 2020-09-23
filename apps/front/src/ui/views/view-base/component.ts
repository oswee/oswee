import { LitElement, customElement } from 'lit-element'

@customElement('view-base')
export class ViewBaseElement extends LitElement {
  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'view-base': ViewBaseElement
  }
}
