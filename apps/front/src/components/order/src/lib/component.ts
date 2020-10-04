import { LitElement, customElement, property, TemplateResult, CSSResultArray, html } from 'lit-element'
import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
// import { connect } from '@oswee/libs/connect'
import template from './template'
import style from './style'

@customElement('dynamic-order')
// export class MyComponentElement extends connect(mapStateToProps, LitElement) {
export class DynamicOrderElement extends LitElement {
  private store: IModuleStore<any>
  // @property({ type: IModuleStore<any> }) store;

  constructor() {
    super()
    // this.store = createStore({})
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
