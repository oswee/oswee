import { combineReducers } from 'redux'

// HYGEN.IO: INJECT IMPORT HERE
import websocket, { WebsocketState } from './src/features/websocket/reducer'
import route, { RoutingState } from './src/features/routing/reducer'
import system, { SystemState } from './src/features/system/reducer'
import theme, { ThemeState } from './src/features/theme/reducer'
import ui, { UiState } from './src/features/ui/reducer'
import launcher, { LauncherState } from './src/features/launcher/reducer'
import users, { UserState } from './src/features/users/reducer'
import applications, { ApplicationsState } from './src/features/applications/reducer'
import modules, { ModulesState } from './src/features/modules/reducer'
import persons, { PersonsState } from './src/features/persons/reducer'
import accounts, { AccountsState } from './src/features/accounts/reducer'
import organizations, { OrganizationsState } from './src/features/organizations/reducer'
import orders, { OrdersState } from './src/features/orders/reducer'
import appModules, { AppNavigationState } from './src/features/app-navigation/reducer'

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
