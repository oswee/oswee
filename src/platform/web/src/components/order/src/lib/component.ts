import {
  LitElement,
  customElement,
  property,
  TemplateResult,
  CSSResultArray,
  html,
} from 'lit-element'
// import { createStore, IModuleStore } from 'redux-dynamic-modules-core'
import { IOrderAwareState } from '../../../../modules/orders/contracts'
import { OrderModules } from '../../../../modules/orders/module'
import { getUserPreferences } from '../../../../modules/settings/selectors'
import { SettingActions } from '../../../../modules/settings/actions'
import { connect } from '@oswee/lib/connect'
import { StringMap } from '@oswee/lib/action'
import template, { IOrderProps } from './template'
import style from './style'
import { store } from '@oswee/pkg/store'

@customElement('dynamic-order')
// export class MyComponentElement extends connect(mapStateToProps, LitElement) {
export class DynamicOrderElement extends connect(store, LitElement) {
  @property({ type: Object }) userPreferences: StringMap<string | boolean>
  // @property({ type: Object }) orderProps: IOrderProps = {
  //   // userPreferences: { ['Cheese']: true },
  //   // setPreferences: p => ['Cheese', false],
  //   userPreferences: { ['Cheese']: true },
  //   setPreferences: () => SettingActions.setPreferences,
  // }

  constructor() {
    super()
    console.log('Constructor hit!')
    store.addModules(OrderModules)
  }

  connectedCallback() {
    super.connectedCallback()
    // Mount the OrderModules
    console.log('Connected', this.userPreferences)
  }

  /**
   * Get the state of userPreferences
   */
  mapState(state: IOrderAwareState) {
    return {
      userPreferences: getUserPreferences(state),
    }
  }

  updated() {
    console.log('Updated:', this.userPreferences)
  }

  /* ConnectedOrder = connect( */
  /*   mapStateToProps, */
  /*   SettingActions */
  /* )(Order); */

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
