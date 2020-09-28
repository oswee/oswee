import { SystemShellElement } from '@oswee/containers/system-shell'
import { connect } from 'oswee/libs/connect/src'
import {
  store,
  RootState,
  WebsocketSelectors,
  LauncherActions,
  LauncherSelectors,
  ThemeSelectors,
} from 'oswee/apps/front/src/store/src/index'

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
