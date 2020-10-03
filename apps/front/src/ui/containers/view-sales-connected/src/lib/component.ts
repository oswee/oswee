import { ViewSalesElement } from '../../views/view-sales'
import { connect } from '@oswee/libs/connect'
import { store, RootState, startApplication } from '../../../../../store/src'

export class ViewSalesConnectedElement extends connect(store, ViewSalesElement) {
  connectedCallback() {
    super.connectedCallback()
    store.dispatch(startApplication(this.appid))
    // store.dispatch(getApplications())
    // store.dispatch(getModules())
  }

  // Map state to props (Connect lib)
  // mapState(state: RootState) {
  //   return {

  //   }
  // }
}

customElements.define(ViewSalesElement.is, ViewSalesConnectedElement)
