import {
  LitElement,
  customElement,
  TemplateResult,
  CSSResultArray,
} from 'lit-element'
import template from './template'
import style from './style'

@customElement('ui-statusbar')
export class UiStatusbarComponent extends LitElement {
  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
