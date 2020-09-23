import { ModulesState } from './models'

export enum ModuleTypes {
  GET = 'MODULE_GET',
  GET_SUCCESS = 'MODULE_GET_SUCCESS',
}

// ACTIONS
interface Get {
  readonly type: ModuleTypes.GET
  readonly meta: object
  readonly payload: object
}

interface GetSuccess {
  readonly type: ModuleTypes.GET_SUCCESS
  readonly payload: ModulesState
}

export type ModuleActionTypes = Get | GetSuccess
