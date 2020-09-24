import { AppNavigationTypes } from './constants'
import { AppModule, AppModules } from './models'
import { ListModulesResponse as ListModulesResponseRpc } from '@dzintars/npm-test-pkg'

interface Loaded {
  readonly type: AppNavigationTypes.LOADED
  readonly payload: {
    appid: string
  }
}

interface ListModulesRequest {
  readonly type: AppNavigationTypes.LIST_MODULES_REQUEST
  readonly payload: {
    id: string
  }
}

interface ListModulesResponse {
  readonly type: AppNavigationTypes.LIST_MODULES_RESPONSE
  readonly payload: AppModules
}

interface ListModulesRpcResponse {
  readonly type: AppNavigationTypes.ListModulesResponse
  readonly payload: ListModulesResponseRpc.AsObject
}

export type AppNavigationActionTypes = ListModulesRequest | ListModulesResponse | Loaded | ListModulesRpcResponse
