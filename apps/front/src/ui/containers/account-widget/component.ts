import { LitElement, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('account-widget')
export class AccountWidgetElement extends LitElement {
  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'account-widget': AccountWidgetElement
  }
}
