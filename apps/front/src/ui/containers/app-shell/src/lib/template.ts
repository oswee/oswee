import { html, TemplateResult } from 'lit-element'
import { AppShellElement } from './component'
import '../../containers/app-taskbar'
import '../../components/app-shortcuts'
import '../../views/view-dispatch-consignments'
import '../../components/action-center'
import '../../containers/ui-statusbar-connected'

export default function template(this: AppShellElement): TemplateResult {
  return html`
    <app-taskbar noshadow></app-taskbar>
    <main>
      <app-shortcuts noshadow></app-shortcuts>
      <!-- <view-dispatch-consignments .applications=${this.entities} noshadow></view-dispatch-consignments> -->
      ${this.isActionCenterDisplayed ? html` <action-center noshadow></action-center> ` : html``}
    </main>
    <ui-statusbar-connected noshadow></ui-statusbar-connected>
  `
}
