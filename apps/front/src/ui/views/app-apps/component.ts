import { customElement, TemplateResult, CSSResultArray } from 'lit-element'
import { AppShellElement } from '../../containers/app-shell'
import template from './template'
import style from './style'

@customElement('app-apps')
export class AppAppsElement extends AppShellElement {
  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [AppShellElement.styles, style]
  }
}
