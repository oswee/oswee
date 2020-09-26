import { ActionTypes } from './types'
import { Types } from './constants'
import { IState } from './models'

export { IState }

const initialState: IState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  error: null,
}

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.SELECT:
      return { ...state, selected: action.uuid }

    case Types.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case Types.LIST_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          ...action.persons.reduce((map, person) => {
            map[person.uuid] = person
            return map
          }, {}),
        },
        ids: action.persons.map(person => person.uuid),
      }

    case Types.LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    case Types.FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case Types.FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.person.uuid]: action.person,
        },
      }

    case Types.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
