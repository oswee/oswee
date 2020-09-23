import { ViewHomeElement } from '../../views/view-home'
import { connect } from '../../../utils/connect'
import { store, RootState, startApplication } from '../../../store'

export class ViewHomeConnectedElement extends connect(store, ViewHomeElement) {
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

customElements.define(ViewHomeElement.is, ViewHomeConnectedElement)
