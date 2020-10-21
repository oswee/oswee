import { LitElement, customElement, property, TemplateResult, CSSResultArray, html } from 'lit-element'
// import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
import { IOrderAwareState } from '../../../../modules/orders/contracts'
import { OrderModules } from '../../../../modules/orders/module'
import { getUserPreferences } from '../../../../modules/settings/selectors'
// import { SettingActions } from '../../../../modules/settings/actions'
import { connect } from '@oswee/libs/connect'
import { StringMap } from '@oswee/libs/action'
import template, { IOrderProps } from './template'
import style from './style'
import { store } from '../../../../store'

@customElement('dynamic-order')
// export class MyComponentElement extends connect(mapStateToProps, LitElement) {
export class DynamicOrderElement extends connect(store, LitElement) {
  @property({ type: Object }) userPreferences: StringMap<string | boolean>
  @property({ type: Object }) orderProps: IOrderProps = {
    // { [key: string]: T }
    userPreferences: { ['Cheese']: true },
    setPreferences: p => ['Cheese', false],
  }

  constructor() {
    super()
    console.log('Constructor hit!')
    store.addModules(OrderModules)
  }

  connectedCallback() {
    super.connectedCallback()
    // Mount the OrderModules
    console.log('Connected')
  }

  // orderProps = <IOrderProps>{
  //   userPreferences: this.userPreferences,
  //   setPreferences:
  // }

  /**
   * Get the state of userPreferences
   */
  mapState(state: IOrderAwareState) {
    console.log(getUserPreferences(state))
    return {
      userPreferences: getUserPreferences(state),
    }
  }

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

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
