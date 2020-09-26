// import {AccountsState} from './lib/features/accounts/src'
// import {AppNavigationState} from './lib/features/app-navigation/src/lib/models'
// import {ApplicationsState} from './lib/features/applications/src'
// import {LauncherState} from './lib/features/launcher/src'
// import {ModulesState} from './lib/features/modules/src'
// import {OrdersState} from './lib/features/orders/src'
// import {OrganizationsState} from './lib/features/organizations/src'
// import {PersonsState} from './lib/features/persons/src'
// import {RoutingState} from './lib/features/routing/src'
// import {SigninState} from './lib/features/signin/src'
// import {SystemState} from './lib/features/system/src'
// import {ThemeState} from './lib/features/theme/src/lib/models'
// import {UiState} from './lib/features/ui/src/lib/models'
// import {UserState} from './lib/features/users/src'
// import {WebsocketState} from './lib/features/websocket/src/lib/models'

declare module 'Types' {
  export interface RootState {
    readonly accounts: AccountsState
    readonly applications: AppNavigationState
    readonly apps: ApplicationsState
    readonly launcher: LauncherState
    readonly modules: ModulesState
    readonly orders: OrdersState
    readonly organizations: OrganizationsState
    readonly persons: PersonsState
    readonly routing: RoutingState
    readonly signin: SigninState
    readonly system: SystemState
    readonly theme: ThemeState
    readonly ui: UiState
    readonly users: UserState
    readonly websocket: WebsocketState
  }
}
// TODO: this should be generated from the css file using some tool
declare module '*.css' {
  let _module: { [key: string]: string }
  export = _module
}
