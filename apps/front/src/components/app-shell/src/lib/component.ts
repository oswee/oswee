import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

// import { connect } from '@oswee/libs/connect'
// import { store } from '../../../../store'
// import { OrderModules } from '../../../../modules/orders/module'

// import { offline } from '@redux-offline/redux-offline'
// import offlineConfig from '@redux-offline/redux-offline/lib/defaults'
// import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
// Saga extension allows us to use Saga middleware in the module store.
// import { getSagaExtension } from 'redux-dynamic-modules-saga'
// Thunk extension allows us to use Thunk middleware in the module store.
// import { getThunkExtension } from 'redux-dynamic-modules-thunk'

@customElement('app-shell')
// export class AppShellElement extends connect(store, LitElement) {
export class AppShellElement extends LitElement {
  // @property({ type: Object }) store: IModuleStore<any>
  // @property({ type: Object }) state: {}

  // constructor() {
  //   super()

  //   // define the initial state where none of the widgets are visible
  //   this.state = {
  //     hackerNews: false,
  //     weather: false,
  //   }

  //   /**
  //    * configure the store and load the thunk and saga extension
  //    * The extensions are optional and you can choose extension based on the middleware you use
  //    * You can also build your own extensions for any other middleware e.g. redux-observable
  //    */
  //   this.store = createStore({
  //     // enhancements: [offline(offlineConfig)],
  //     extensions: [getThunkExtension(), getSagaExtension()],
  //   })
  // }

  connectedCallback(): void {
    super.connectedCallback()
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
