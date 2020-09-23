import { LitElement, TemplateResult, CSSResultArray, property } from 'lit-element'
import template from './template'
import style from './style'

export class ViewHomeElement extends LitElement {
  static get is(): string {
    return 'view-home'
  }
  @property({ type: String }) appid: string = '9a30119-d673-4978-b393-f608fe28ae07'

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
    'view-home': ViewHomeElement
  }
}
