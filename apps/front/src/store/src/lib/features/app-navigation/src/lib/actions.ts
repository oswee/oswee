import { createAction, ActionsUnion } from '../../actions'
import { AppNavigationTypes } from './constants'
import { AppNavigationActionTypes } from './types'
import { AppModule, AppModules } from './models'
import { ApplicationActionTypes, ApplicationTypes } from '../applications/types'
import { ListModulesResponse as ListModulesResponseRpc } from '@dzintars/npm-test-pkg'

// ACTION CREATORS
const loaded = (appid: string): AppNavigationActionTypes => ({
  type: AppNavigationTypes.LOADED,
  payload: {
    appid,
  },
})

const listModulesRequest = (id: string): AppNavigationActionTypes => ({
  type: AppNavigationTypes.LIST_MODULES_REQUEST,
  payload: {
    id,
  },
})

const listModulesResponse = (payload: AppModules): AppNavigationActionTypes => ({
  type: AppNavigationTypes.LIST_MODULES_RESPONSE,
  payload,
})

const listModulesRpcResponse = (payload: ListModulesResponseRpc.AsObject): AppNavigationActionTypes => ({
  type: AppNavigationTypes.ListModulesResponse,
  payload,
})

export const AppNavigationActions = {
  listModulesRequest,
  listModulesResponse,
  loaded,
}

export const ModxActions = {
  fetchModulesList: () => createAction(AppNavigationTypes.LIST_FETCH_MODULES),
  fetchModulesListRequest: () => createAction(AppNavigationTypes.LIST_FETCH_MODULES_REQUEST),
  fetchModulesListSuccess: (payload: AppModules) =>
    createAction(AppNavigationTypes.LIST_FETCH_MODULES_SUCCESS, payload),
  fetchModulesListFailure: (error: Error) =>
    createAction(AppNavigationTypes.LIST_FETCH_MODULES_FAILURE, { payload: { error } }),
}

export type ModxActions = ActionsUnion<typeof ModxActions>
