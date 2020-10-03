import { LitElement, property, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('app-shortcuts')
export class AppShortcutsElement extends LitElement {
  @property({ type: Object }) modules: Modules = {
    entities: {
      dashboard: {
        uuid: 'dashboard',
        name: 'Dashboard',
        icon: 'info',
      },
      orders: {
        uuid: 'orders',
        name: 'Orders',
        icon: 'placemark',
      },
      kanban: {
        uuid: 'kanban',
        name: 'Kanban',
        icon: 'kanban',
      },
    },
    order: ['dashboard', 'orders', 'kanban'],
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

export interface Module {
  uuid: string
  name: string
  icon: string
}
export interface Modules {
  entities: { [key: string]: Module }
  order: string[]
}
