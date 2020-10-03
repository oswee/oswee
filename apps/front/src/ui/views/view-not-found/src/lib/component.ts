import { LitElement, TemplateResult, CSSResultArray, customElement, property } from 'lit-element'
import template from './template'
import style from './style'

@customElement('view-not-found')
export class ViewNotFoundElement extends LitElement {
  // static get is(): string {
  //   return 'view-not-found'
  // }

  // @property({ type: Boolean, reflect: true }) selected: boolean = false
  // @property({ type: Number }) key: number = 0
  // @property({ type: String }) name: string = 'view'

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }

  protected createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'view-not-found': ViewNotFoundElement
  }
}
