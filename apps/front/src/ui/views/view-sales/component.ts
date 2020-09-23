import { LitElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

export class ViewSalesElement extends LitElement {
  static get is() {
    return 'view-sales'
  }
  @property({ type: String }) appid: string = 'c178025e-a209-4c50-8c34-36d35f36494c'

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
    'view-sales': ViewSalesElement
  }
}
