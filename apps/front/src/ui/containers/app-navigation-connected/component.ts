// import { customElement, property } from 'lit-element'
import { AppNavigationElement } from '../../components/app-navigation'
import { connect } from '../../../utils/connect'
import {
  store,
  RootState,
  ApplicationSelectors,
  ModuleSelectors,
  AppNavigationSelectors,
  RoutingSelectors,
  AppNavigationActions,
} from '../../../store'

// @customElement('app-navigation-connected')
export class AppNavigationConnectedElement extends connect(store, AppNavigationElement) {
  connectedCallback() {
    super.connectedCallback()
    console.log('App Navigation Connected:', this.appid)
    store.dispatch(AppNavigationActions.loaded(this.appid))
  }

  // Map state to props (Connect lib)
  mapState(state: RootState) {
    return {
      // pathname: RoutingSelectors.pathname(state),
      isApplicationsFetching: ApplicationSelectors.selectFetchState(state),
      isModulesFetching: ModuleSelectors.selectFetchState(state),
      appid: AppNavigationSelectors.selectCurrentApplicationId(state),
      modules: AppNavigationSelectors.selectAllModulesArray(state),
      // pathname: AppNavigationSelectors.selectCurrentApplicationPermalink(state),
    }
  }
}

customElements.define(AppNavigationElement.is, AppNavigationConnectedElement)

// declare global {
//   interface HTMLElementTagNameMap {
//     'app-navigation-connected': AppNavigationConnectedElement
//   }
// }
