import { ModuleTypes, ModuleActionTypes } from './types'
import { ModulesState } from './models'

export { ModulesState }

const initialState: ModulesState = {
  entities: {},
  ids: [],
  highlightedModule: '',
  fetching: false,
  currentModule: '',
  selected: {
    id: '',
    state: 0,
  },
}

export default (state: ModulesState = initialState, action: ModuleActionTypes): ModulesState => {
  switch (action.type) {
    case ModuleTypes.GET:
      return {
        ...state,
        fetching: true,
      }
    case ModuleTypes.GET_SUCCESS:
      return {
        ...state,
        entities: {
          ...action.payload.entities,
        },
        ids: action.payload.ids,
        fetching: false,
      }

    default:
      return state
  }
}
