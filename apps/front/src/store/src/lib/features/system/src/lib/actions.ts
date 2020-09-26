// import { createAction, ActionsUnion } from '../../actions'
import { ActionTypes } from './types'
import { Types } from './constants'
// import { SystemState } from './models'

// ACTION CREATORS
const select = (id: string): ActionTypes => ({
  type: Types.SELECT,
  payload: {
    id,
  },
})

const loaded = (): ActionTypes => ({
  type: Types.LOADED,
})

export const SystemActions = {
  select,
  loaded,
}
