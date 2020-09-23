import { ModuleTypes, ModuleActionTypes } from './types'
import { ModulesState } from './models'

// ACTION CREATORS
export const getModules = (): ModuleActionTypes => ({
  type: ModuleTypes.GET,
  meta: { websocket: true },
  payload: { stakeholder: '54322' },
})

export const getModulesSuccess = (payload: ModulesState): ModuleActionTypes => ({
  type: ModuleTypes.GET_SUCCESS,
  payload,
})
