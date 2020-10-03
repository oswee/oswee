import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('nav-item-title')
export class NavItemTitleElement extends LitElement {
  @property({ type: String }) label: string = 'Unspecified label'

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
