import { LitElement, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('system-shell')
export class SystemShellElement extends LitElement {
  connectedCallback(): void {
    super.connectedCallback()
    console.log('Shell connected')
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
