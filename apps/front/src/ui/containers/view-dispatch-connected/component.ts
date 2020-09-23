import { property } from 'lit-element'
import { ViewDispatchElement } from '../../views/view-dispatch'
import { connect } from '../../../utils/connect'
import { store, RootState, RoutingActions, startApplication, ApplicationSelectors } from '../../../store'

export class ViewDispatchConnectedElement extends connect(store, ViewDispatchElement) {
  @property({ type: String }) defaultModuleID: string = ''
  connectedCallback() {
    super.connectedCallback()
    store.dispatch(startApplication(this.appid))
    this.defaultModuleID !== '' ? store.dispatch(RoutingActions.push('/dispatch/consignments')) : false
    // store.dispatch(RoutingActions.push('/dispatch/consignments'))
    // store.dispatch(getApplications())
    // store.dispatch(getModules())
  }

  // Map state to props (Connect lib)
  mapState(state: RootState) {
    return {
      // defaultModuleID: ApplicationSelectors.selectDefaultApplicationModule(state),
    }
  }
}

customElements.define(ViewDispatchElement.is, ViewDispatchConnectedElement)
