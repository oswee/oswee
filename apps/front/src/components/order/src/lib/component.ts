import { LitElement, customElement, property, TemplateResult, CSSResultArray, html } from 'lit-element'
import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
import { IOrderAwareState } from '../../../../modules/orders/contracts'
import { OrderModules } from '../../../../modules/orders/module'
import { getUserPreferences } from '../../../../modules/settings/selectors'
import { SettingActions } from '../../../../modules/settings/actions'
import { connect } from '@oswee/libs/connect'
import template, { IOrderProps } from './template'
import style from './style'
import { store } from '../../../../store'
import { StringMap } from '@oswee/libs/action'

@customElement('dynamic-order')
// export class MyComponentElement extends connect(mapStateToProps, LitElement) {
export class DynamicOrderElement extends connect(store, LitElement) {
  @property() userPreferences: StringMap<string | boolean>
  // @property() orderProps: IOrderProps = {
  //   userPreferences: this.userPreferences,
  // }

  constructor() {
    super()
    // this.store = createStore({})
  }

  /**
   * Get the state of userPreferences
   */
  mapState(state: IOrderAwareState) {
    return {
      userPreferences: getUserPreferences(state),
    }
  }

  // orderProps = <IOrderProps>{
  //   userPreferences: this.userPreferencess,
  // }

  // ConnectedOrder = connect(this.mapStateToProps, SettingActions, Order)

  /* ConnectedOrder = connect( */
  /*   mapStateToProps, */
  /*   SettingActions */
  /* )(Order); */

  // export const DynamicOrder = () => (
  //   <DynamicModuleLoader modules= {[OrderModules]} >
  //   <ConnectedOrder />{" "}
  //   < /DynamicModuleLoader>
  // )

  connectedCallback(): void {
    super.connectedCallback()
    // Mount the OrderModules
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
