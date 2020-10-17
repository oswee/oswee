import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
import { getSagaExtension } from 'redux-dynamic-modules-saga'
// import { connect } from '@oswee/libs/connect'
import template from './template'
import style from './style'

@customElement('system-shell')
// export class SystemShellElement extends connect(store, LitElement) {
export class SystemShellElement extends LitElement {
  // private store: IModuleStore<any>
  // @property({ type: IModuleStore<any> }) store;
  constructor() {
    super()
    // this.store = createStore({ extensions: [getSagaExtension()] })
  }
  connectedCallback(): void {
    super.connectedCallback()
    // console.log(this.store)
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
