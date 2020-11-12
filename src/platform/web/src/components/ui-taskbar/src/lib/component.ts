import {
  LitElement,
  customElement,
  TemplateResult,
  CSSResultArray,
} from 'lit-element'
import template from './template'
import style from './style'

@customElement('ui-taskbar')
export class UiTaskbarComponent extends LitElement {
  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
