import { LitElement, property, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import { Buttons } from '../../../assets/style'
import template from './template'
import style from './style'

@customElement('action-center')
export class ActionCenterElement extends LitElement {
  @property({ type: String }) key: string = '9a30119-d673-4978-b393-f608fe28ae07'

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [Buttons, style]
  }
  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}
