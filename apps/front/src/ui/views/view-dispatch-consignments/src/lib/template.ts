import { html, TemplateResult } from 'lit-element'
import { ViewDispatchConsignmentsElement } from './component'
import '../../containers/app-taskbar'
import '../../components/leaflet-map'
import '../../components/ui-toolbar'
import '../../elements/ui-panel'
import '../../components/app-navigation'
import '../../containers/app-navigation-connected'

export default function template(this: ViewDispatchConsignmentsElement): TemplateResult {
  return html`
    <app-taskbar noshadow></app-taskbar>
    <ui-toolbar>
      <button class="btn btn--md">New Project</button>
      <button class="btn btn--md">New Order</button>
      <button class="btn btn--md">New Route</button>
      <button class="btn btn--md">Import</button>
      <button class="btn btn--md">Delete</button>
      <button class="btn btn--md">Geo-Code</button>
      <button class="btn btn--md">Export</button>
      <button class="btn btn--md">Preview</button>
    </ui-toolbar>
    <main>
      <app-navigation .appid="${this.appid}" noshadow></app-navigation>
      <div class="container left">
        <ui-panel class="projects">Projects</ui-panel>
        <ui-panel class="orders">Orders</ui-panel>
      </div>
      <div class="container right">
        <leaflet-map></leaflet-map>
      </div>
    </main>
  `
}
