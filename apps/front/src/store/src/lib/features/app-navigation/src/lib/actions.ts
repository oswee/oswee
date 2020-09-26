import { createAction, ActionsUnion } from 'oswee/libs/action/src/index'
import { Types } from './constants'
import { AppNavigationActionTypes } from './types'
import { AppModule, AppModules } from './models'
import { ApplicationActionTypes, ApplicationTypes } from '../applications/types'
// import { ListModulesResponse as ListModulesResponseRpc } from '@dzintars/npm-test-pkg'

// ACTION CREATORS
const loaded = (appid: string): AppNavigationActionTypes => ({
  type: Types.LOADED,
  payload: {
    appid,
  },
})

const listModulesRequest = (id: string): AppNavigationActionTypes => ({
  type: Types.LIST_MODULES_REQUEST,
  payload: {
    id,
  },
})

const listModulesResponse = (payload: AppModules): AppNavigationActionTypes => ({
  type: Types.LIST_MODULES_RESPONSE,
  payload,
})

// const listModulesRpcResponse = (payload: ListModulesResponseRpc.AsObject): AppNavigationActionTypes => ({
//   type: Types.ListModulesResponse,
//   payload,
// })

export const AppNavigationActions = {
  listModulesRequest,
  listModulesResponse,
  loaded,
}

export const ModxActions = {
  fetchModulesList: () => createAction(Types.LIST_FETCH_MODULES),
  fetchModulesListRequest: () => createAction(Types.LIST_FETCH_MODULES_REQUEST),
  fetchModulesListSuccess: (payload: AppModules) => createAction(Types.LIST_FETCH_MODULES_SUCCESS, payload),
  fetchModulesListFailure: (error: Error) => createAction(Types.LIST_FETCH_MODULES_FAILURE, { payload: { error } }),
}

export type ModxActions = ActionsUnion<typeof ModxActions>
