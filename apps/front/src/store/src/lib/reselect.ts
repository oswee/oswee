import { Store } from 'redux'
import * as ReselectTools from 'reselect-tools'

// HYGEN.IO: INJECT IMPORT HERE
import { WebsocketSelectors } from './src/features/websocket'
import { RoutingSelectors } from './src/features/routing'
import { SystemSelectors } from './src/features/system'
import { UiSelectors } from './src/features/ui'
import { LauncherSelectors } from './src/features/launcher'
import { ThemeSelectors } from './src/features/theme'
import { UserSelectors } from './src/features/users'
import { ApplicationSelectors } from './src/features/applications'
import { ModuleSelectors } from './src/features/modules'
import { OrganizationSelectors } from './src/features/organizations'

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
