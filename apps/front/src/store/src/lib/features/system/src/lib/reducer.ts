import { SystemTypes, SystemActionTypes } from './types'
import { SystemState } from './models'

export { SystemState }

const initialState: SystemState = {
  entities: {},
  ids: [],
  selected: '',
  error: null,
}

export default (state: SystemState = initialState, action: SystemActionTypes): SystemState => {
  switch (action.type) {
    case SystemTypes.SELECT:
      return {
        ...state,
        selected: action.payload.id,
      }
    default:
      return state
  }
}
