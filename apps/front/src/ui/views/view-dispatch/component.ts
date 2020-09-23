import { TemplateResult, CSSResultArray, property, LitElement } from 'lit-element'
import template from './template'
import style from './style'

export class ViewDispatchElement extends LitElement {
  static get is(): string {
    return 'view-dispatch'
  }
  @property({ type: String }) appid: string = '54789c07-bb43-4db4-8b2d-1a8e1f8c67f1'

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
    'view-dispatch': ViewDispatchElement
  }
}
