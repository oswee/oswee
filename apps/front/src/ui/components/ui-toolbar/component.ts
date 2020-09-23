import { LitElement, property, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import { Theme } from '../../../assets/style'
import template from './template'
import style from './style'

@customElement('ui-toolbar')
export class UiToolbarElement extends LitElement {
  @property({ type: String }) key: string = '9a30119-d673-4978-b393-f608fe28ae07'

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [Theme, style]
  }

  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}
