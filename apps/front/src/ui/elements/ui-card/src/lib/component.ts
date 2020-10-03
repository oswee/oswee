import { LitElement, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('ui-card')
export class UiCardElement extends LitElement {
  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'ui-card': UiCardElement
  }
}

export interface ApplicationShortcutData {
  key: number
  name: string
}
