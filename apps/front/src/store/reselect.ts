import { Store } from 'redux'
import * as ReselectTools from 'reselect-tools'

// HYGEN.IO: INJECT IMPORT HERE
import { WebsocketSelectors } from './features/websocket'
import { RoutingSelectors } from './features/routing'
import { SystemSelectors } from './features/system'
import { UiSelectors } from './features/ui'
import { LauncherSelectors } from './features/launcher'
import { ThemeSelectors } from './features/theme'
import { UserSelectors } from './features/users'
import { ApplicationSelectors } from './features/applications'
import { ModuleSelectors } from './features/modules'
import { OrganizationSelectors } from './features/organizations'

export const startReselect = (store: Store) => {
  ReselectTools.getStateWith(() => store.getState())
  // HYGEN.IO: INJECT SELECTORS HERE
  ReselectTools.registerSelectors(WebsocketSelectors)
  ReselectTools.registerSelectors(RoutingSelectors)
  ReselectTools.registerSelectors(SystemSelectors)
  ReselectTools.registerSelectors(UiSelectors)
  ReselectTools.registerSelectors(LauncherSelectors)
  ReselectTools.registerSelectors(ThemeSelectors)
  ReselectTools.registerSelectors(UserSelectors)
  ReselectTools.registerSelectors(ApplicationSelectors)
  ReselectTools.registerSelectors(ModuleSelectors)
  ReselectTools.registerSelectors(OrganizationSelectors)
}
