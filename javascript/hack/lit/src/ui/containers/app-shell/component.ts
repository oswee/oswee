import { LitElement, TemplateResult, CSSResultArray } from 'lit'
import { customElement } from 'lit/decorators.js'
import template from './template.js'
import style from './style.js'

@customElement('app-shell')
export class AppShell extends LitElement {
  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
