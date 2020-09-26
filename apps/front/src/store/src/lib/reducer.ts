import { combineReducers } from 'redux'

// HYGEN.IO: INJECT IMPORT HERE
import websocket, { IState as WebsocketState } from './features/websocket/src/lib/reducer'
import route, { IState as RoutingState } from './features/routing/src/lib/reducer'
import system, { IState as SystemState } from './features/system/src/lib/reducer'
import theme, { IState as ThemeState } from './features/theme/src/lib/reducer'
import ui, { IState as UiState } from './features/ui/src/lib/reducer'
import launcher, { IState as LauncherState } from './features/launcher/src/lib/reducer'
import users, { IState as UserState } from './features/users/src/lib/reducer'
import applications, { IState as ApplicationsState } from './features/applications/src/lib/reducer'
import modules, { IState as ModulesState } from './features/modules/src/lib/reducer'
import persons, { IState as PersonsState } from './features/persons/src/lib/reducer'
import accounts, { IState as AccountsState } from './features/accounts/src/lib/reducer'
import organizations, { IState as OrganizationsState } from './features/organizations/src/lib/reducer'
import orders, { IState as OrdersState } from './features/orders/src/lib/reducer'
import appModules, { IState as AppNavigationState } from './features/app-navigation/src/lib/reducer'

export interface RootState {
  // HYGEN.IO: INJECT STATE HERE
  websocket: WebsocketState
  route: RoutingState
  system: SystemState
  ui: UiState
  launcher: LauncherState
  theme: ThemeState
  users: UserState
  applications: ApplicationsState
  modules: ModulesState
  persons: PersonsState
  accounts: AccountsState
  organizations: OrganizationsState
  orders: OrdersState
  appModules: AppNavigationState
}

export const rootReducer = combineReducers<RootState>({
  // HYGEN.IO: INJECT REDUCER HERE
  websocket,
  route,
  system,
  ui,
  launcher,
  theme,
  users,
  applications,
  modules,
  persons,
  accounts,
  organizations,
  orders,
  appModules,
})
