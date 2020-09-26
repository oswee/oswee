import { ActionTypes } from './types'
import { Types } from './constants'
import { IState } from './models'

export { IState }

const initialState: IState = {
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

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.GET:
      return {
        ...state,
        fetching: true,
      }
    case Types.GET_SUCCESS:
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
