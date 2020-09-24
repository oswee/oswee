// import { createAction, ActionsUnion } from '../../actions'
import { SystemTypes, SystemActionTypes } from './types'
// import { SystemState } from './models'

// ACTION CREATORS
const select = (id: string): SystemActionTypes => ({
  type: SystemTypes.SELECT,
  payload: {
    id,
  },
})

const loaded = (): SystemActionTypes => ({
  type: SystemTypes.LOADED,
})

export const SystemActions = {
  select,
  loaded,
}
