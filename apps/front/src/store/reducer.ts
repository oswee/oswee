import { combineReducers } from 'redux'

// HYGEN.IO: INJECT IMPORT HERE
import websocket, { WebsocketState } from './features/websocket/reducer'
import route, { RoutingState } from './features/routing/reducer'
import system, { SystemState } from './features/system/reducer'
import theme, { ThemeState } from './features/theme/reducer'
import ui, { UiState } from './features/ui/reducer'
import launcher, { LauncherState } from './features/launcher/reducer'
import users, { UserState } from './features/users/reducer'
import applications, { ApplicationsState } from './features/applications/reducer'
import modules, { ModulesState } from './features/modules/reducer'
import persons, { PersonsState } from './features/persons/reducer'
import accounts, { AccountsState } from './features/accounts/reducer'
import organizations, { OrganizationsState } from './features/organizations/reducer'
import orders, { OrdersState } from './features/orders/reducer'
import appModules, { AppNavigationState } from './features/app-navigation/reducer'

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
