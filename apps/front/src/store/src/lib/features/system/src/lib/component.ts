import { SystemShellElement } from '../../../../../ui/containers/system-shell/src/index'
import { connect } from 'oswee/libs/connect'
import { store, RootState, WebsocketSelectors, LauncherActions, LauncherSelectors, ThemeSelectors } from '../../..'

export class SystemShellConnectedElement extends connect(store, SystemShellElement) {
  mapState(state: RootState) {
    return {
      websocketState: WebsocketSelectors.selectConnectedState(state),
      isLauncherVisible: LauncherSelectors.getLauncherVisibility(state),
      theme: ThemeSelectors.getTheme(state),
    }
  }

  mapEvents() {
    return {
      'nav-item-click': () => LauncherActions.hideLauncher(),
    }
  }
}

customElements.define(SystemShellElement.is, SystemShellConnectedElement)
