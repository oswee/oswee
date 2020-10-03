import { LitElement, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('view-signin')
export class ViewSignInElement extends LitElement {
  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }

  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'view-signin': ViewSignInElement
  }
}
