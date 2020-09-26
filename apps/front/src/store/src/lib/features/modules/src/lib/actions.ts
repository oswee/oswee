import { ActionTypes } from './types'
import { Types } from './constants'
import { IState } from './models'

// ACTION CREATORS
export const getModules = (): ActionTypes => ({
  type: Types.GET,
  meta: { websocket: true },
  payload: { stakeholder: '54322' },
})

export const getModulesSuccess = (payload: IState): ActionTypes => ({
  type: Types.GET_SUCCESS,
  payload,
})
