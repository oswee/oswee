import { Store } from 'redux'
import * as ReselectTools from 'reselect-tools'

// HYGEN.IO: INJECT IMPORT HERE
import { WebsocketSelectors } from './features/websocket/src'
import { RoutingSelectors } from './features/routing/src'
import { SystemSelectors } from './features/system/src'
import { UiSelectors } from './features/ui/src'
import { LauncherSelectors } from './features/launcher/src'
import { ThemeSelectors } from './features/theme/src'
import { UsersSelectors } from './features/users/src'
import { ApplicationsSelectors } from './features/applications/src'
import { ModulesSelectors } from './features/modules/src'
import { OrganizationsSelectors } from './features/organizations/src'

export const startReselect = (store: Store) => {
  ReselectTools.getStateWith(() => store.getState())
  // HYGEN.IO: INJECT SELECTORS HERE
  ReselectTools.registerSelectors(WebsocketSelectors)
  ReselectTools.registerSelectors(RoutingSelectors)
  ReselectTools.registerSelectors(SystemSelectors)
  ReselectTools.registerSelectors(UiSelectors)
  ReselectTools.registerSelectors(LauncherSelectors)
  ReselectTools.registerSelectors(ThemeSelectors)
  ReselectTools.registerSelectors(UsersSelectors)
  ReselectTools.registerSelectors(ApplicationsSelectors)
  ReselectTools.registerSelectors(ModulesSelectors)
  ReselectTools.registerSelectors(OrganizationsSelectors)
}
